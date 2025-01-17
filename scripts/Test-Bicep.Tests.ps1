BeforeAll {
    Install-Module Bicep -Force
}

Describe "Test-Bicep" {
    $path = Resolve-Path "$PSScriptRoot/.."

    $testCases = Get-ChildItem -Path $path -Include *.bicep -Recurse | ForEach-Object {
        @{
            Name     = $PSItem.FullName.Replace($path, "")
            FullName = $PSItem.FullName
        }
    }

    It "<Name> is valid bicep" -TestCases $testCases {
        Test-BicepFile -Path $FullName | Should -Be $true
    }
}
