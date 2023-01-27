# Log in first with Connect-AzAccount if not using Cloud Shell
Function Connect {
    Add-AzAccount -TenantId '97e7fa82-8ca6-4a93-a6c8-96ae01b69d29'
    $azContext = Get-AzContext
    $azProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile
    $profileClient = New-Object -TypeName Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient -ArgumentList ($azProfile)
    $token = $profileClient.AcquireAccessToken($azContext.Subscription.TenantId)
    $authHeader = @{
        'Content-Type'='application/json'
        'Authorization'='Bearer ' + $token.AccessToken
    }
}

Connect

# Invoke the REST API
$subscriptionId = '91be4fbe-f86c-494e-99cc-b22d311d8ae3'
$regulatoryName = 'Microsoft-cloud-security-benchmark'
$regulatoryControlName = 'IR.4'
#Regulatory Compliance Standards - List
$restUri = ('https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Security/regulatoryComplianceStandards?api-version=2019-01-01-preview').replace('{subscriptionId}',$subscriptionId)
#Regulatory Compliance Controls - List
$restUri = ('https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Security/regulatoryComplianceStandards/{regulatoryComplianceStandardName}/regulatoryComplianceControls?api-version=2019-01-01-preview').replace('{subscriptionId}',$subscriptionId).Replace('{regulatoryComplianceStandardName}',$regulatoryName)
#Regulatory Compliance Assessments - List
$restUri = ('https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Security/regulatoryComplianceStandards/{regulatoryComplianceStandardName}/regulatoryComplianceControls/{regulatoryComplianceControlName}/regulatoryComplianceAssessments?api-version=2019-01-01-preview').replace('{subscriptionId}',$subscriptionId).Replace('{regulatoryComplianceStandardName}',$regulatoryName).Replace('{regulatoryComplianceControlName}',$regulatoryControlName)
$method = 'GET'
$response = Invoke-RestMethod -Uri $restUri -Method $method -Headers $authHeader

$response.value | Format-List