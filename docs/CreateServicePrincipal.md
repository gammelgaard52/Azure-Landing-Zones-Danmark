# Create service account

```powershell
$CustomerTenant = '<tenantID>' # Replace with customers tenant GUID
Connect-AzAccount -TenantId $CustomerTenant # Sign in with Global Admin credentials
```
Create a ServicePrincipal and assign role on scope to it
```powershell
$spName = 'sp-<service>-<role>' # sp-dmz-001-p-contributor
$spRole = '<role>' # eg. Contributor or Owner - or another RBAC role
$spScope = '/subscriptions/<subscriptionID>' # For root management group, set it to '/'
$sp = New-AzADServicePrincipal -DisplayName $spName -Scope $spScope -Role $spRole
$SetCred = New-AzADAppCredential -ApplicationId $sp.AppId -StartDate (get-date) -EndDate (Get-Date).addyears(10)
```

You now have all the information you need to log in with the new sp and set PAL
```powershell
$Secret = $SetCred.SecretText | ConvertTo-SecureString -AsPlainText -Force
$Credential = [PSCredential]::new($sp.AppId,$Secret )
Connect-AzAccount -ServicePrincipal -Tenant $CustomerTenant -Credential $Credential
```
Get values needed for devsops setup:
```powershell
[pscustomobject]@{
    ManagementGroupID     = $CustomerTenant
    ManagementGroupName   = 'Tenant Root Group'
    ServicePrincipalId    = $sp.AppId
    ServicePrincipalKey   = $SetCred.SecretText
    TenantID              = $CustomerTenant
    ServiceConnectionName = $spName
}
```