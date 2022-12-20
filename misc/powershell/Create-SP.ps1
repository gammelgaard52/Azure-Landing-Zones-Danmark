<#
   az ad sp create-for-rbac --name "myApp" --role contributor \
   --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} \
   --sdk-auth
#>

$spArray = @(
    <#@{ # SP for tenant root level
        name = "sp-tenant-root"
        role = "Owner"
        scope = "/"
        description = "Service Principal for tenant root level"
    }#>
    @{ # SP for canary
        name = "sp-canary-contributor"
        role = "Contributor"
        scope = "/providers/Microsoft.Management/managementGroups/lz-canary"
        description = "Service Principal for canary management group"
    }
    @{ # SP for prod
        name = "sp-prod-contributor"
        role = "Contributor"
        scope = "/providers/Microsoft.Management/managementGroups/lz"
        description = "Service Principal for prod management group"
    }
)

[array]$sps = foreach ($sp in $spArray) {New-AzADServicePrincipal -DisplayName $sp.name -Role $sp.role -Scope $sp.scope -Description $sp.description}
<#
    $sp.PasswordCredentials | Select-Object SecretText
    $sp.AppId
    Get-AzContext | Format-List

    Get-AzContext | Select-Object TenantId {$_.tenantId}
    Get-AzADServicePrincipal -DisplayName sp-canary-root
    Remove-AzADServicePrincipal -ObjectId 7b6febdf-b361-4200-839f-a9b94b13953a
    Remove-AzADServicePrincipal -ObjectId cbc734ba-46d9-4177-98dd-876d746b41df
    Remove-AzRoleAssignment -ObjectId 7b6febdf-b361-4200-839f-a9b94b13953a -Scope "/" -RoleDefinitionName Owner
#>

#$app = Get-AzADApplication -ApplicationId $sp.AppId
$sps[0].AppId
$sps[1].PasswordCredentials | Format-List
# ga = github-actions
# use -Description next time, to display a meaningful description of the integration
New-AzADAppFederatedCredential -ApplicationObjectId (Get-AzADApplication -ApplicationId $sps[0].AppId).Id -Audience api://AzureADTokenExchange -Issuer 'https://token.actions.githubusercontent.com' -Name 'ga-sp-tenant-root-canary' -Subject 'repo:gammelgaard52/Azure-Landing-Zones-Danmark:environment:Canary'
New-AzADAppFederatedCredential -ApplicationObjectId (Get-AzADApplication -ApplicationId $sps[0].AppId).Id -Audience api://AzureADTokenExchange -Issuer 'https://token.actions.githubusercontent.com' -Name 'ga-sp-tenant-root-production' -Subject 'repo:gammelgaard52/Azure-Landing-Zones-Danmark:environment:Production'
Get-AzADAppFederatedCredential -ApplicationObjectId (Get-AzADApplication -ApplicationId $sps[0].AppId).Id | Format-Table Name,Id,Issuer
Get-AzADAppFederatedCredential -ApplicationObjectId (Get-AzADApplication -ApplicationId $sps[0].AppId).Id | Format-List

#[array]$federations = foreach ($federation in $sps) {New-AzADAppFederatedCredential -ApplicationObjectId (Get-AzADApplication -ApplicationId $federation.AppId).Id -Audience api://AzureADTokenExchange -Issuer 'https://token.actions.githubusercontent.com' -Name 'ga-sp-tenant-root-canary' -Subject 'repo:gammelgaard52/Azure-Landing-Zones-Danmark:environment:Canary'}
New-AzADAppFederatedCredential -ApplicationObjectId (Get-AzADApplication -ApplicationId $sps[0].AppId).Id -Audience api://AzureADTokenExchange -Issuer 'https://token.actions.githubusercontent.com' -Name ('ga-' + $sps[0].Displayname) -Subject 'repo:gammelgaard52/Azure-Landing-Zones-Danmark:environment:Canary' -Description 'Federation with GitHub Actions'
New-AzADAppFederatedCredential -ApplicationObjectId (Get-AzADApplication -ApplicationId $sps[1].AppId).Id -Audience api://AzureADTokenExchange -Issuer 'https://token.actions.githubusercontent.com' -Name ('ga-' + $sps[1].Displayname) -Subject 'repo:gammelgaard52/Azure-Landing-Zones-Danmark:environment:Production' -Description 'Federation with GitHub Actions'

<#
Get-AzManagementGroup | format-table Name,Id
Get-AzManagementGroup | get-member
#>

<#
$sp = New-AzADServicePrincipal -DisplayName sample -Debug
$federationBody = ConvertTo-Json @{
    name = "main-branch"
    issuer = "https://token.actions.githubusercontent.com"
    subject = "repo:$($repoOrganisation)/$($repoName):ref:refs/heads/main"
    description = "Federation credentials for $githubRepository main branch"
    audiences = @(
        "api://AzureADTokenExchange"
    )
};
Invoke-AzRestMethod -Method POST -Payload $federationBody "https://graph.microsoft.com/beta/applications/$((Get-AzADApplication -AppId $sp.AppId).Id)/federatedIdentityCredentials"
#>