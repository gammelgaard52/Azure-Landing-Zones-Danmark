<#
   az ad sp create-for-rbac --name "myApp" --role contributor \
   --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} \
   --sdk-auth
#>

$spParm = @{
    name = "sp-tenant-root"
}
$sp = New-AzADServicePrincipal -DisplayName $spParm.name -Role Owner -Scope "/"
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

$app = Get-AzADApplication -ApplicationId $sp.AppId

# ga = github-actions
# use -Description next time, to display a meaningful description of the integration
New-AzADAppFederatedCredential -ApplicationObjectId (Get-AzADApplication -ApplicationId $sp.AppId).Id -Audience api://AzureADTokenExchange -Issuer 'https://token.actions.githubusercontent.com/' -Name 'ga-sp-tenant-root-canary' -Subject 'repo:gammelgaard52/Azure-Landing-Zones-Danmark:environment:Canary'
New-AzADAppFederatedCredential -ApplicationObjectId (Get-AzADApplication -ApplicationId $sp.AppId).Id -Audience api://AzureADTokenExchange -Issuer 'https://token.actions.githubusercontent.com/' -Name 'ga-sp-tenant-root-production' -Subject 'repo:gammelgaard52/Azure-Landing-Zones-Danmark:environment:Production'
Get-AzADAppFederatedCredential -ApplicationObjectId (Get-AzADApplication -ApplicationId $sp.AppId).Id | Format-Table Name,Id,Issuer