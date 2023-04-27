# A useful PowerShell script I use for sending events to Azure Event Hub demos

Connect-AzAccount
Select-AzSubscription -SubscriptionId '<your subscription number>';
Set-ExecutionPolicy Unrestricted
#Install-Module –Name Azure.EventHub
Import-Module Az.EventHub

$Token = Get-AzureEHSASToken -URI "<your event hub account>.servicebus.windows.net/<your event hub name>" -AccessPolicyName "<your policy name>" -AccessPolicyKey "<your policy key>"
$StartTime = Get-Date
$EndTime = $StartTime.AddHours(2.0)
$Token = Get-AzEventHub -ResourceGroupName rg-management -NamespaceName hub-management-compliance -Name hub-sub-canary-sandbox | New-AzEventHubAuthorizationRuleSASToken -AuthorizationRuleId $updatedAuthRule.Id  -KeyType Primary -ExpiryTime $EndTime

Get-AzEventHub -ResourceGroupName rg-management -NamespaceName hub-management-compliance -Name hub-sub-canary-sandbox


$EventHubUri = "<your event hub account>.servicebus.windows.net/<your event hub name>"
$EventHubTimer = new-timespan -Minutes 30
$StopWatch = [diagnostics.stopwatch]::StartNew()
$APIUri = "https://"+ $EventHubUri +"/messages"
While ($StopWatch.elapsed -lt $EventHubTimer){
$RandomDetroit = Get-Random -minimum 65 -maximum 85
$RandomChicago = Get-Random -minimum 65 -maximum 85
$RandomKalamazoo = Get-Random -minimum 65 -maximum 85
$LabData = '[{ "SensorId":"101", "Location":"Detroit, MI", "Speed": ' + $RandomDetroit + ' },
{ "SensorId":"102", "Location":"Chicago, IL", "Speed": ' + $RandomChicago + ' },
{ "SensorId":"103", "Location":"Kalamazoo, MI", "Speed": ' + $RandomKalamazoo + ' }]'
Invoke-WebRequest -Method POST -Uri ($APIUri) -Header @{ Authorization = $Token} -ContentType "application/json;type=entry;charset=utf-8" -Body $LabData
Start-Sleep -seconds 5
}
Write-Host "Event Hub data simulation ended"