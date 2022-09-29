targetScope = 'managementGroup'
resource Deny_AppGW_Without_WAF 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'Deny-AppGW-Without-WAF'
  properties: {
    policyType: 'Custom'
    mode: 'Indexed'
    displayName: 'Application Gateway should be deployed with WAF enabled'
    description: 'This policy enables you to restrict that Application Gateways is always deployed with WAF enabled'
    metadata: {
      version: '1.0.0'
      category: 'Network'
    }
    parameters: {
      effect: {
        type: 'String'
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
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
            equals: 'Microsoft.Network/applicationGateways'
          }
          {
            field: 'Microsoft.Network/applicationGateways/sku.name'
            notequals: 'WAF_v2'
          }
        ]
      }
      then: {
        effect: '[parameters(\'effect\')]'
      }
    }
  }
}