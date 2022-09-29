targetScope = 'managementGroup'
resource Append_AppService_httpsonly 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'Append-AppService-httpsonly'
  properties: {
    policyType: 'Custom'
    mode: 'All'
    displayName: 'AppService append enable https only setting to enforce https setting.'
    description: 'Appends the AppService sites object to ensure that  HTTPS only is enabled for  server/service authentication and protects data in transit from network layer eavesdropping attacks. Please note Append does not enforce compliance use then deny.'
    metadata: {
      version: '1.0.0'
      category: 'App Service'
    }
    parameters: {
      effect: {
        type: 'String'
        defaultValue: 'Append'
        allowedValues: [
          'Append'
          'Disabled'
        ]
        metadata: {
          displayName: 'Effect'
          description: 'Enable or disable the execution of the policy'
        }
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Web/sites'
          }
          {
            field: 'Microsoft.Web/sites/httpsOnly'
            notequals: true
          }
        ]
      }
      then: {
        effect: '[parameters(\'effect\')]'
        details: [
          {
            field: 'Microsoft.Web/sites/httpsOnly'
            value: true
          }
        ]
      }
    }
  }
}