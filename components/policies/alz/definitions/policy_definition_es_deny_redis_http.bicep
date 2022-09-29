targetScope = 'managementGroup'
resource Deny_Redis_http 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'Deny-Redis-http'
  properties: {
    policyType: 'Custom'
    mode: 'Indexed'
    displayName: 'Azure Cache for Redis only secure connections should be enabled'
    description: 'Audit enabling of only connections via SSL to Azure Cache for Redis. Validate both minimum TLS version and enableNonSslPort is disabled. Use of secure connections ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking'
    metadata: {
      version: '1.0.0'
      category: 'Cache'
    }
    parameters: {
      effect: {
        type: 'String'
        defaultValue: 'Deny'
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        metadata: {
          displayName: 'Effect'
          description: 'The effect determines what happens when the policy rule is evaluated to match'
        }
      }
      minimumTlsVersion: {
        type: 'String'
        defaultValue: '1.2'
        allowedValues: [
          '1.2'
          '1.1'
          '1.0'
        ]
        metadata: {
          displayName: 'Select minumum TLS version for Azure Cache for Redis.'
          description: 'Select minimum TLS version for Azure Cache for Redis.'
        }
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Cache/redis'
          }
          {
            anyOf: [
              {
                field: 'Microsoft.Cache/Redis/enableNonSslPort'
                equals: 'true'
              }
              {
                field: 'Microsoft.Cache/Redis/minimumTlsVersion'
                notequals: '[parameters(\'minimumTlsVersion\')]'
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