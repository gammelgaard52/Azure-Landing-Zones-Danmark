targetScope = 'managementGroup'

resource MySQL_Configure_Enforce_SSL 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'MySQL-Configure-Enforce-SSL'
  properties: {
    displayName: 'Configure Azure Database for MySQL to enforce SSL'
    description: 'Enforces SSL for Azure Database for MySQL.'
    policyType: 'Custom'
    mode: 'Indexed'
    metadata: {
      version: '1.0'
      category: 'SQL'
    }
    parameters: {
      effect: {
        type: 'String'
        metadata: {
          displayName: 'Effect'
          description: 'Enable or disable the execution of the policy'
        }
        allowedValues: [
          'Modify'
          'Disabled'
        ]
        defaultValue: 'Modify'
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.DBforMySQL/servers'
          }
          {
            anyOf: [
              {
                field: 'Microsoft.DBforMySQL/servers/sslEnforcement'
                exists: false
              }
              {
                field: 'Microsoft.DBforMySQL/servers/sslEnforcement'
                notEquals: 'Enabled'
              }
            ]
          }
        ]
      }
      then: {
        effect: '[parameters(\'effect\')]'
        details: {
          roleDefinitionIds: [
            '/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
          ]
          conflictEffect: 'audit'
          operations: [
            {
              operation: 'addOrReplace'
              field: 'Microsoft.DBforMySQL/servers/sslEnforcement'
              value: 'Enabled'
            }
          ]
        }
      }
    }
  }
}
