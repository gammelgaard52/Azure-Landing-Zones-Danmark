param AzureLogAnalytics_ManagedIdentity_name string = 'Managed-Identity-Compliance'
param workflowName string = 'Logic-App-Compliance'
param location string = resourceGroup().location
param rootUrl string = 'https://api.loganalytics.io'
param workspaceName string = 'regulatorycompliance'

param roleDefinitionResourceId string = '73c42c96-874c-492b-b04d-ab87d138a893' //Reader

resource workspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' existing = {
  name: workspaceName
}

resource workflow 'Microsoft.Logic/workflows@2019-05-01' = {
  name: workflowName
  location: location
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${resourceId('Microsoft.ManagedIdentity/userAssignedIdentities/', AzureLogAnalytics_ManagedIdentity_name)}': {}
    }
  }
  properties: {
    state: 'Enabled'
    definition: {
      '$schema': 'https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#'
      contentVersion: '1.0.0.0'
      parameters: {}
      triggers: {
        manual: {
          type: 'Request'
          kind: 'Http'
          inputs: {
            schema: {}
          }
        }
      }
  actions: {
    HTTP_get_logs: {
      runAfter: {}
      type: 'Http'
      inputs: {
        authentication: {
          audience: rootUrl
          identity:resourceId('Microsoft.ManagedIdentity/userAssignedIdentities/', AzureLogAnalytics_ManagedIdentity_name)
          type: 'ManagedServiceIdentity'
        }
        method: 'GET'
        queries: {
          query: 'print "42"'
        }
        uri: '${rootUrl}/v1/workspaces/${workspace.properties.customerId}/query'
      }
    }
  }
  outputs: {}
  }
  parameters: {}
  }
  dependsOn: [
    roleAssignment
  ]
}

resource logAnalyticsReaderRoleDefinition 'Microsoft.Authorization/roleDefinitions@2018-01-01-preview' existing = {
  scope: subscription()
  name: roleDefinitionResourceId //Reader
}

resource AzureLogAnalytics_ManagedIdentity_name_resource 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' = {
  name: AzureLogAnalytics_ManagedIdentity_name
  location: location
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  scope: workspace
  name: guid(resourceGroup().id, AzureLogAnalytics_ManagedIdentity_name_resource.id, roleDefinitionResourceId)
  properties: {
    roleDefinitionId: logAnalyticsReaderRoleDefinition.id
    principalId: AzureLogAnalytics_ManagedIdentity_name_resource.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
