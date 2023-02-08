# .. something before happen
$loc = 'westeurope'
$rg = 'rg-kubernetes-d-001'

# 1
## Create an attestation provider ##
$attestationProviderName = "attk8sd001"
#$attestationProvider = New-AzAttestation -Name $attestationProviderName -ResourceGroupName $rg -Location $loc
$attestationProvider = Get-AzAttestationProvider -Name $attestationProviderName -ResourceGroupName $rg
$attestationProviderId = $attestationProvider.Id

# 2
## Create private endpoint connection. ##
$privateEndpointConnection = New-AzPrivateLinkServiceConnection -Name 'pls-conn-kubernetes-d-001' -PrivateLinkServiceId $attestationProviderId -GroupID "Standard"
## Disable private endpoint network policy ##
$vnet = Get-AzVirtualNetwork -Name vnet-kubernetes-d-001 -ResourceGroupName $rg
$vnet.Subnets[0].PrivateEndpointNetworkPolicies = "Disabled"
$vnet | Set-AzVirtualNetwork
## Create private endpoint
New-AzPrivateEndpoint  -ResourceGroupName $rg -Name 'pep-kubernetes-d-001' -Location $loc -Subnet $vnet.Subnets[0] -PrivateLinkServiceConnection $privateEndpointConnection

# 3
## Create private dns zone. ##
$zone = New-AzPrivateDnsZone -ResourceGroupName $rg -Name "kubernetes-d-001.attest.azure.net"
## Create dns network link. ##
$link = New-AzPrivateDnsVirtualNetworkLink -ResourceGroupName $rg -ZoneName "kubernetes-d-001.attest.azure.net" -Name "pdns-vnetl-kubernetes-d-001" -VirtualNetworkId $vnet.Id
## Create DNS configuration ##
$config = New-AzPrivateDnsZoneConfig -Name "kubernetes-d-001.attest.azure.net" -PrivateDnsZoneId $zone.ResourceId
## Create DNS zone group. ##
New-AzPrivateDnsZoneGroup -ResourceGroupName $rg -PrivateEndpointName 'pep-kubernetes-d-001' -Name 'pdns-zgrp-kubernetes-d-001' -PrivateDnsZoneConfig $config

# 4
# Test using local nslookup

# Monitoring

# 1
$attestationProvider = Get-AzAttestationProvider -Name $attestationProviderName -ResourceGroupName $rg
$storageAccount = New-AzStorageAccount -ResourceGroupName $rg -Name 'saattk8sd001' -SkuName Standard_LRS -Location $loc
$log = @()
$categories = Get-AzDiagnosticSettingCategory -ResourceId $attestationProvider.Id
$categories | ForEach-Object {$log += New-AzDiagnosticSettingLogSettingsObject -Enabled $true -Category $_.Name -RetentionPolicyDay 7 -RetentionPolicyEnabled $true}
Register-AzResourceProvider -ProviderNamespace 'microsoft.insights' -ConsentToPermissions $true
New-AzDiagnosticSetting -Name 'attk8sd001-logs-to-saattk8sd001' -ResourceId $attestationProvider.Id -StorageAccountId $storageAccount.Id -Log $log

Get-AzDiagnosticSettingCategory -ResourceId $attestationProvider.Id