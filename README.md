# Azure-Landing-Zones-Danmark (Policy Definition POC)

Denne branch er et minimalt proof of concept for udrulning af Azure Policy-definitioner, samtidig med at den oprindelige workflow- og miljøparameterstruktur bevares.

## Omfang af denne POC

Repositoriet er bevidst reduceret for at vise et enkelt flow:

1. **Brugerdefineret policy-definition i JSON**
   - `modules/policies/definitions/audit-require-rg-tags.json`

## Udrulningsworkflow

GitHub Actions-workflowet, der bruges af denne branch, er:
- `.github/workflows/policies.yml`

## Opsætning af miljø (Azure og GitHub)

### Azure-konfiguration

1. Opret (eller vælg) en Azure AD App Registration til GitHub Actions.
2. Opret en federated credential for GitHub OIDC, der peger på:
   - Repo: denne repository
   - Branch: `main` (workflowet er bundet til `main` via push/PR triggers)
3. Giv appen adgang til at administrere policy-definitioner på management group:
   - Standard i workflowet er `lz-canary`. Hvis du bruger et andet navn, så opdatér `PREFIX` i `.github/workflows/policies.yml`.
   - Minimum: **Policy Contributor** på management group (eller højere, fx **Owner**).
4. Notér følgende værdier til GitHub Secrets:
   - **Tenant ID**
   - **Client ID** (App Registration)
   - **Management Subscription ID** (bruges til login, selvom deployment sker på management group)

### GitHub-konfiguration

1. Opret følgende repository secrets:
   - `AZURE_TENANT_ID`
   - `AZURE_CLIENT_ID`
   - `AZURE_MANAGEMENT_SUBSCRIPTION_ID`
2. Bekræft at workflowet har `id-token: write` (allerede sat i `.github/workflows/policies.yml`).
3. Workflowet bruger `LOCATION: westeurope` og `PREFIX: lz-canary`.
4. Kør workflowet via **Actions** → **Deploy Policies** (eller via push/PR til `main`).
   - `Deploy Canary`-jobbet kører kun ved PR eller manuel kørsel.

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
