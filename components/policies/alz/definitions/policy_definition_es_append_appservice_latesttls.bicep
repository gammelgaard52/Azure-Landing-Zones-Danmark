targetScope = 'managementGroup'
resource Append_AppService_latestTLS 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'Append-AppService-latestTLS'
  properties: {
    policyType: 'Custom'
    mode: 'All'
    displayName: 'AppService append sites with minimum TLS version to enforce.'
    description: 'Append the AppService sites object to ensure that min Tls version is set to required minimum TLS version. Please note Append does not enforce compliance use then deny.'
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
      minTlsVersion: {
        type: 'String'
        defaultValue: '1.2'
        allowedValues: [
          '1.2'
          '1.0'
          '1.1'
        ]
        metadata: {
          displayName: 'Select version minimum TLS Web App config'
          description: 'Select version  minimum TLS version for a  Web App config to enforce'
        }
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Web/sites/config'
          }
          {
            field: 'Microsoft.Web/sites/config/minTlsVersion'
            notEquals: '[parameters(\'minTlsVersion\')]'
          }
        ]
      }
      then: {
        effect: '[parameters(\'effect\')]'
        details: [
          {
            field: 'Microsoft.Web/sites/config/minTlsVersion'
            value: '[parameters(\'minTlsVersion\')]'
          }
        ]
      }
    }
  }
}