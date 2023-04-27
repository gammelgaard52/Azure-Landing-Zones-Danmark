New-AzureADServicePrincipal -AppId bf7b6499-ff71-4aa2-97a4-f372087be7f0 -DisplayName "Confidential VM Orchestrator"

New-AzADServicePrincipal -AppId 'bf7b6499-ff71-4aa2-97a4-f372087be7f0' -ServicePrincipalName "Confidential VM Orchestrator"

430219b2-30dd-4fae-8ab5-1677881734c0


$spArray = @(
    @{ # SP for prod
        name = "sp-kubernetes-d-001"
        description = "Service Principal for Kubernetes development 001"
    }
)

[array]$sps = foreach ($sp in $spArray) {New-AzADServicePrincipal -DisplayName $sp.name -Description $sp.description}