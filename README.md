# Azure-Landing-Zones-Danmark (Policy Definition POC)

Denne branch er et minimalt proof of concept for udrulning af Azure Policy-definitioner, samtidig med at den oprindelige workflow- og miljøparameterstruktur bevares.

## Omfang af denne POC

Repositoriet er bevidst reduceret for at vise et enkelt flow:

1. **Brugerdefineret policy-definition i JSON**
   - `modules/policies/definitions/audit-require-rg-tags.json`

## Udrulningsworkflow

GitHub Actions-workflowet, der bruges af denne branch, er:
- `.github/workflows/policies.yml`

## Lokal validering (valgfrit)

```powershell
$mgId = "<management-group-id>"
$subId = "<subscription-id>"
$tenantId = "<tenant-id>"
$location = "<location>"

Connect-AzAccount -Tenant $tenantId
Set-AzContext -Tenant $tenantId -Subscription $subId

.\modules\policies\scripts\Compare-PolicyDefinition.ps1 -Path .\modules\policies\definitions -ManagementGroupId $mgId

.\modules\policies\scripts\Deploy-PolicyDefinition.ps1 -Path .\modules\policies\definitions -Location $location -ManagementGroupId $mgId -Verbose -WhatIf
```
