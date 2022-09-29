targetScope = 'managementGroup'
resource Deny_MachineLearning_PublicAccessWhenBehindVnet 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'Deny-MachineLearning-PublicAccessWhenBehindVnet'
  properties: {
    policyType: 'Custom'
    mode: 'Indexed'
    displayName: 'Deny public acces behind vnet to Azure Machine Learning workspace'
    description: 'Deny public access behind vnet to Azure Machine Learning workspaces.'
    metadata: {
      version: '1.0.0'
      category: 'Machine Learning'
    }
    parameters: {
      effect: {
        type: 'String'
        metadata: {
          displayName: 'Effect'
          description: 'Enable or disable the execution of the policy'
        }
        allowedValues: [
          'Audit'
          'Disabled'
          'Deny'
        ]
        defaultValue: 'Deny'
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.MachineLearningServices/workspaces'
          }
          {
            anyOf: [
              {
                field: 'Microsoft.MachineLearningServices/workspaces/allowPublicAccessWhenBehindVnet'
                exists: false
              }
              {
                field: 'Microsoft.MachineLearningServices/workspaces/allowPublicAccessWhenBehindVnet'
                notEquals: false
              }
            ]
          }
        ]
      }
      then: {
        effect: '[parameters(\'effect\')]'
      }
    }
  }
}