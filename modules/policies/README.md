# Policies Module

This folder contains custom policy definitions only.

## Policy Definitions

Definitions are stored in original JSON format and deployed at management group scope.

Example policy definition:
- `modules/policies/definitions/audit-require-rg-tags.json`

## How To

Prefer policies in this order:

- Built-in policies
- Community policies
- Create your own with inspiration from the above

### Get Aliases

```bash
namespace=Microsoft.Storage
az provider show --namespace $namespace --expand "resourceTypes/aliases" --query "resourceTypes[].aliases[].name"
```

#### Modifiable Properties

```powershell
Get-AzPolicyAlias |
Select-Object -ExpandProperty "Aliases" |
Where-Object { $PSItem.DefaultMetadata.Attributes -eq "Modifiable" } |
Select-Object -ExpandProperty Name |
Set-Clipboard
```

## Remove Policies

```powershell
Remove-AzPolicyDefinition -Name 'PolicyName' -ManagementGroupName 'managementGroupName' -Force
```
