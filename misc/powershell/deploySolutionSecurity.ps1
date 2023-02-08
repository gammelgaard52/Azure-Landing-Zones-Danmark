$param = @{
    solutionName = 'Security'
    logAnalyticsWorkspaceName = 'regulatorycompliance'
}

New-AzResourceGroupDeployment -Name log-analytics-solution-security -ResourceGroupName rg-management -TemplateParameterObject $param -TemplateFile C:\VersionControl\Intern\Azure-Landing-Zones-Danmark\modules\shared\log-analytics-workspace-solution.bicep