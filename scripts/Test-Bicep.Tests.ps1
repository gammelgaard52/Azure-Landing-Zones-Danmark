Describe "Test-Bicep" {
    BeforeAll {
        Install-Module bicep -AllowClobber -Scope CurrentUser -Force
        Import-Module bicep -Scope Global
    }

    $path = Resolve-Path "$PSScriptRoot/.."

    $testCases = Get-ChildItem -Path $path -Include *.bicep -Recurse | ForEach-Object {
        @{
            Name     = $PSItem.FullName.Replace($path, "")
            FullName = $PSItem.FullName
        }
    }

    It "<Name> is valid bicep" -TestCases $testCases {
        Test-Bicep -Path (Get-Content -Path $FullName) | Should -Be $true
    }
}
