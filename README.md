# Azure-Landing-Zones-Danmark (Policy POC)

This branch is a minimal proof of concept for Azure Policy deployment.

## Scope of this POC

The repository is intentionally reduced to show the core policy flow only:

1. **Custom definition with parameters**
   - `modules/policies/definitions/defender-configure-security-contacts.json`
2. **Custom initiative that combines built-in + custom**
   - `modules/policies/initiatives/configure-defender-for-cloud.json`
3. **Assignment of that initiative**
   - `modules/policies/assignments/defender_for_cloud.bicep`

Environment-specific parameters are centralized in:
- `environments/canary/policies.parameters.json`

## Deployment workflow

The GitHub Actions workflow used by this branch is:
- `.github/workflows/policies.yml` (canary only)

## Local validation (optional)

```powershell
$mgId = "lz-canary"
$subId = "91be4fbe-f86c-494e-99cc-b22d311d8ae3"
$tenantId = "97e7fa82-8ca6-4a93-a6c8-96ae01b69d29"
$location = "westeurope"

Connect-AzAccount -Tenant $tenantId
Set-AzContext -Tenant $tenantId -Subscription $subId

.\modules\policies\scripts\Compare-PolicyDefinition.ps1 -Path .\modules\policies\definitions -ManagementGroupId $mgId
.\modules\policies\scripts\Compare-Initiative.ps1 -Path .\modules\policies\initiatives -ManagementGroupId $mgId
.\modules\policies\scripts\Compare-PolicyAssignment.ps1 -Path .\modules\policies\assignments -Prefix $mgId

.\modules\policies\scripts\Deploy-PolicyDefinition.ps1 -Path .\modules\policies\definitions -Location $location -ManagementGroupId $mgId -Verbose -WhatIf
.\modules\policies\scripts\Deploy-Initiative.ps1 -Path .\modules\policies\initiatives -Location $location -ManagementGroupId $mgId -Verbose -WhatIf
.\modules\policies\scripts\Deploy-PolicyAssignment.ps1 -Path .\modules\policies\assignments -Location $location -Prefix $mgId -Environment canary -Verbose -WhatIf
```
