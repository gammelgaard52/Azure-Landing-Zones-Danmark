$ResourceGroupName = 'rg-management'
#az login
az account set --subscription "sub-canary-sandbox"
$ManagedIdentity = az identity show --name 'Managed-Identity-Compliance' --resource-group $ResourceGroupName | ConvertFrom-Json

$principalId = $ManagedIdentity.principalId
# Get current role assignments
$currentRoles = (az rest `
    --method get `
    --uri https://graph.microsoft.com/v1.0/servicePrincipals/$principalId/appRoleAssignments `
    | ConvertFrom-Json).value `
    | ForEach-Object { $_.appRoleId }

#Get resourceId for Graph API
$graphResourceId = az ad sp list --display-name "Microsoft Graph" --query [0].id
#az ad sp list --display-name "Microsoft Graph" > 'c:\temp\data.txt'
#Get appRoleIds : Sites.ReadWrite.All
$graphId = az ad sp list --query "[?appDisplayName=='Microsoft Graph'].appId | [0]" --all

$sitesReadWriteAll = az ad sp show --id $graphId --query "appRoles[?value=='Sites.ReadWrite.All'].id | [0]" -o tsv

$appRoleIds = $sitesReadWriteAll
#Loop over all appRoleIds for Graph API
foreach ($appRoleId in $appRoleIds) {
    $roleMatch = $currentRoles -match $appRoleId
    if ($roleMatch.Length -eq 0) {
        # Add the role assignment to the principal
        $body = "{'principalId':'$principalId','resourceId':'$graphResourceId','appRoleId':'$appRoleId'}";
        az rest `
            --method post `
            --uri https://graph.microsoft.com/v1.0/servicePrincipals/$principalId/appRoleAssignments `
            --body $body `
            --headers Content-Type=application/json
    }
}

<#
    "name": "sub-canary-sandbox",
    "state": "Enabled",
    "tenantId": "97e7fa82-8ca6-4a93-a6c8-96ae01b69d29",
    "user": {
      "name": "maras@netdesign.dk",
      "type": "user"
    }
#>