Set-AzContext -TenantId '97e7fa82-8ca6-4a93-a6c8-96ae01b69d29' -SubscriptionId 'c3453bba-7597-4385-bd32-d6776c77538c'
$assignments = Get-AzPolicyAssignment -Scope /subscriptions/c3453bba-7597-4385-bd32-d6776c77538c/
$assignments.Count
Get-AzPolicyAssignment -Scope /subscriptions/c3453bba-7597-4385-bd32-d6776c77538c/ | ForEach-Object {Remove-AzPolicyAssignment -Id $_.PolicyAssignmentId}

get-childitem c:\users\maras\.ssh\ | foreach-object {Copy-Item -Path $_.FullName -Destination 'C:\VSC\NetDesign\Project0\Azure-Landing-Zones-Danmark\misc\Intel SGX'}