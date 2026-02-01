# Azure-Landing-Zones-Danmark (Policy Definition POC)

This branch is a minimal proof of concept for deploying Azure Policy definitions only, while keeping the original workflow and environment parameter structure.

## Scope of this POC

The repository is intentionally reduced to show a single flow:

1. **Custom policy definition JSON**
   - `modules/policies/definitions/audit-require-rg-tags.json`

## Deployment workflow

The GitHub Actions workflow used by this branch is:
- `.github/workflows/policies.yml`

## Local validation (optional)

```powershell
$mgId = "lz-canary"
$subId = "91be4fbe-f86c-494e-99cc-b22d311d8ae3"
$tenantId = "97e7fa82-8ca6-4a93-a6c8-96ae01b69d29"
$location = "westeurope"

Connect-AzAccount -Tenant $tenantId
Set-AzContext -Tenant $tenantId -Subscription $subId

.\modules\policies\scripts\Compare-PolicyDefinition.ps1 -Path .\modules\policies\definitions -ManagementGroupId $mgId

.\modules\policies\scripts\Deploy-PolicyDefinition.ps1 -Path .\modules\policies\definitions -Location $location -ManagementGroupId $mgId -Verbose -WhatIf
```
