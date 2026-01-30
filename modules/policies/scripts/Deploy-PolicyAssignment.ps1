[CmdletBinding(SupportsShouldProcess = $true)]
param (
    [Parameter(Mandatory = $true)]
    [String]
    $Path,

    [Parameter(Mandatory = $true)]
    [String]
    $Location,

    [Parameter(Mandatory = $true)]
    [String]
    $Prefix,

    [Parameter(Mandatory = $true)]
    [ValidateSet("canary", "prod")]
    [String]
    $Environment
)

function Join-Template {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSReviewUnusedParameter", "", Justification = "False positive")]
    [CmdletBinding()]
    [OutputType([String])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [String[]]
        $Path,

        [Parameter(Mandatory = $true)]
        [String]
        $Prefix,

        [Parameter(Mandatory = $true)]
        [String]
        $ManagementGroupId
    )

    begin {
        "targetScope = 'managementGroup'"
        $params = @()
    }

    process {
        $params += (Get-Content -Path $Path | Where-Object { $PSItem -match "^param " } | ForEach-Object { $PSItem -replace "^param managementGroupId string$", "param managementGroupId string = '$ManagementGroupId'" -replace "^param root string$", "param root string = '$Prefix'" })
        Get-Content -Path $Path | Where-Object { $PSItem -ne "targetScope = 'managementGroup'" -and $PSItem -notmatch "^param " }
    }

    end {
        $params | Select-Object -Unique
    }
}

function Get-Parameter {
    param (
        [Parameter(Mandatory = $true)]
        [String]
        $Path,

        [Parameter(Mandatory = $true)]
        [String]
        $Environment,

        [Parameter(Mandatory = $true)]
        [String]
        $TemplatePath
    )

    $localParameters = "$Path/.$Environment.parameters.json"
    if (Test-Path -Path $localParameters) {
        return Resolve-Path -Path $localParameters
    }

    $repoRoot = Resolve-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath "../../..")
    $centralParameters = Join-Path -Path $repoRoot -ChildPath "environments/$Environment/policies.parameters.json"
    if (Test-Path -Path $centralParameters) {
        $templateParameters = Join-Path -Path (Get-Item -Path $Path) -ChildPath ".deploy.$Environment.parameters.json"
        $parameterInfo = Get-Content -Path $TemplatePath | Select-String -Pattern "^\s*param\s+([A-Za-z0-9_]+)\b" | ForEach-Object {
            [PSCustomObject]@{
                Name       = $PSItem.Matches[0].Groups[1].Value
                HasDefault = $PSItem.Line -match "="
            }
        }
        $parameterNames = $parameterInfo | Select-Object -ExpandProperty Name -Unique
        $requiredNames = $parameterInfo | Where-Object { -not $PSItem.HasDefault } | Select-Object -ExpandProperty Name -Unique
        $central = Get-Content -Path $centralParameters -Raw | ConvertFrom-Json
        $centralValues = $central.parameters
        if (-not $centralValues) {
            $centralValues = @{}
        }

        $missing = @()
        foreach ($name in $requiredNames) {
            if (-not ($centralValues.PSObject.Properties.Name -contains $name)) {
                $missing += $name
            }
        }

        if ($missing.Count -gt 0) {
            throw "Missing parameters in '$centralParameters' for template '$TemplatePath': $($missing -join ', ')"
        }

        $filtered = [ordered]@{
            '$schema'       = $central.'$schema'
            contentVersion  = $central.contentVersion
            parameters      = [ordered]@{}
        }

        foreach ($name in $parameterNames) {
            if ($centralValues.PSObject.Properties.Name -contains $name) {
                $filtered.parameters[$name] = $centralValues.$name
            }
        }

        $filtered | ConvertTo-Json -Depth 20 | Set-Content -Path $templateParameters -WhatIf:$false
        return $templateParameters
    }

    return Resolve-Path -Path "$PSScriptRoot/template.parameters.json"
}

function Deploy-Template {
    param (
        [Parameter(Mandatory = $true)]
        [String]
        $Path,

        [Parameter(Mandatory = $true)]
        [String]
        $Prefix,

        [Parameter(Mandatory = $true)]
        [String]
        $ManagementGroupId,

        [Parameter(Mandatory = $true)]
        [String]
        $Location,

        [Parameter(Mandatory = $true)]
        [String]
        $DeploymentName,

        [Parameter(Mandatory = $true)]
        [String]
        $Environment
    )

    $template = Join-Path -Path (Get-Item -Path $Path) -ChildPath ".deploy.bicep"
    Get-ChildItem -Path $Path/*.bicep -Exclude ".deploy.bicep" | Join-Template -Prefix $Prefix -ManagementGroupId $ManagementGroupId | Set-Content -Path $template -WhatIf:$false
    $parameters = Get-Parameter -Path $Path -Environment $Environment -TemplatePath $template
    New-AzManagementGroupDeployment -Name $DeploymentName -ManagementGroupId $ManagementGroupId -Location $Location -TemplateFile $template -TemplateParameterFile $parameters
}

function Get-AssignmentGroup {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSReviewUnusedParameter", "", Justification = "False positive")]
    param (
        [Parameter(Mandatory = $true)]
        [String]
        $Path,

        [Parameter(Mandatory = $true)]
        [String]
        $Prefix
    )

    $assignments = Get-ChildItem -Path $Path -Directory -Recurse | Sort-Object -Property FullName
    $root = Get-Item -Path $Path
    $assignments = $assignments += $root
    $assignments | Sort-Object FullName | ForEach-Object {
        @{
            Path              = $PSItem.FullName
            ManagementGroupId = $PSItem.FullName.Replace($root.FullName, $Prefix) -replace "[\\/]", "-"
        }
    }
}

function Deploy-TemplateRecursive {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSReviewUnusedParameter", "", Justification = "False positive")]
    param (
        [Parameter(Mandatory = $true)]
        [String]
        $Path,

        [Parameter(Mandatory = $true)]
        [String]
        $Prefix,

        [Parameter(Mandatory = $true)]
        [String]
        $Location,

        [Parameter(Mandatory = $true)]
        [String]
        $Environment
    )

    Get-AssignmentGroup -Path $Path -Prefix $Prefix | ForEach-Object {
        $path = $PSItem.Path
        $managementGroupId = $PSItem.ManagementGroupId
        Write-Verbose -Message "Deploying policy assignments to '$managementGroupId'"
        Deploy-Template -Path $path -Prefix $Prefix -ManagementGroupId $managementGroupId -Location $Location -DeploymentName "policy-assignments" -Environment $Environment
    }
}

Deploy-TemplateRecursive -Path $Path -Prefix $Prefix -Location $Location -Environment $Environment
