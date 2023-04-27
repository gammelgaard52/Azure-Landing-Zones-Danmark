PUT https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Security/automations/{automationName}?api-version=2019-01-01-preview

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
    Write-Output $authHeader
}

Connect

# Invoke the REST API
$subscriptionId = '5f286deb-1cae-4e74-a41a-a2a8f4fbc0e6'
$resourceGroupName = 'Microsoft-cloud-security-benchmark'
$automationName = 'IR.4'
$restUri = ('https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Security/automations/{automationName}?api-version=2019-01-01-preview').Replace('{subscriptionId}',$subscriptionId).Replace('{resourceGroupName}',$resourceGroupName).Replace('{automationName}',$automationName)
$method = 'PUT'

$body = @{
    location= 'westeurope'
    etag= 'etag value (must be supplied for update)'
    tags= @{}
    properties= @{
        description= 'An example of a security automation that triggers one LogicApp resource (myTest1) on any security assessment'
        isEnabled= 'true'
        sources= @(
            @{
            eventSource= 'RegulatoryComplianceAssessment'
            }
        )
        actions= @(
            @{
            actionType= 'EventHub'
            connectionString= 'Endpoint=sb://hub-management-compliance.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=qx+Y5uI/Qvk6db3/7su1zoY+gIr8k2sz08BPYhi/4Ac='
            eventHubResourceId = '/subscriptions/786930b8-88e0-4812-9adc-e82faa94b6a6/resourceGroups/rg-management/providers/Microsoft.EventHub/namespaces/hub-management-compliance'
            sasPolicyName= 'RootManageSharedAccessKey'
            }
        )
    }
}

$response = Invoke-RestMethod -Uri $restUri -Method $method -Headers $authHeader -Body $body

$response.value | Format-List




<#
{
    "properties": {
      "description": "An example of a security automation that triggers one LogicApp resource (myTest1) on any security assessment",
      "isEnabled": true,
      "metadata": {
        "createdDateTimeUtc": "2023-01-13T14:40:58.9417139Z",
        "createdBy": "8ee7dc56-b052-4661-91fb-25052a6b5d4b",
        "lastUpdatedDateTimeUtc": "2023-01-13T14:40:58.9417139Z",
        "lastUpdatedBy": "8ee7dc56-b052-4661-91fb-25052a6b5d4b"
      },
      "scopes": [
        {
          "description": "A description that helps to identify this scope - for example: security assessments that relate to the subscription 786930b8-88e0-4812-9adc-e82faa94b6a6",
          "scopePath": "/subscriptions/786930b8-88e0-4812-9adc-e82faa94b6a6"
        }
      ],
      "sources": [
        {
          "eventSource": "RegulatoryComplianceAssessment"
        }
      ],
      "actions": [
        {
          "isTrustedServiceEnabled": false,
          "sasPolicyName": "RootManageSharedAccessKey",
          "eventHubResourceId": "/subscriptions/786930b8-88e0-4812-9adc-e82faa94b6a6/resourceGroups/rg-management/providers/Microsoft.EventHub/namespaces/hub-management-compliance",
          "actionType": "EventHub"
        }
      ]
    },
    "id": "/subscriptions/786930b8-88e0-4812-9adc-e82faa94b6a6/resourcegroups/rg-management/providers/Microsoft.Security/automations/compliancetest",
    "name": "compliancetest",
    "type": "Microsoft.Security/automations",
    "etag": "\"7b0129b0-0000-0d00-0000-63c16d7b0000\"",
    "location": "westeurope",
    "tags": {}
  }
  #>