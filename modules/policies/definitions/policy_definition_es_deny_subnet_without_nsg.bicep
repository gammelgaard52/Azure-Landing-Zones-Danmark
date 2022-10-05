targetScope = 'managementGroup'
resource Deny_Subnet_Without_Nsg 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'Deny-Subnet-Without-Nsg'
  properties: {
    policyType: 'Custom'
    mode: 'All'
    displayName: 'Subnets should have a Network Security Group'
    description: 'This policy denies the creation of a subnet without a Network Security Group. NSG help to protect traffic across subnet-level.'
    metadata: {
      version: '2.0.0'
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
      excludedSubnets: {
        type: 'Array'
        metadata: {
          displayName: 'Excluded Subnets'
          description: 'Array of subnet names that are excluded from this policy'
        }
        defaultValue: [
          'GatewaySubnet'
          'AzureFirewallSubnet'
          'AzureFirewallManagementSubnet'
        ]
      }
    }
    policyRule: {
      if: {
        anyOf: [
          {
            allOf: [
              {
                equals: 'Microsoft.Network/virtualNetworks'
                field: 'type'
              }
              {
                count: {
                  field: 'Microsoft.Network/virtualNetworks/subnets[*]'
                  where: {
                    allOf: [
                      {
                        exists: 'false'
                        field: 'Microsoft.Network/virtualNetworks/subnets[*].networkSecurityGroup.id'
                      }
                      {
                        field: 'Microsoft.Network/virtualNetworks/subnets[*].name'
                        notIn: '[parameters(\'excludedSubnets\')]'
                      }
                    ]
                  }
                }
                notEquals: 0
              }
            ]
          }
          {
            allOf: [
              {
                field: 'type'
                equals: 'Microsoft.Network/virtualNetworks/subnets'
              }
              {
                field: 'name'
                notIn: '[parameters(\'excludedSubnets\')]'
              }
              {
                field: 'Microsoft.Network/virtualNetworks/subnets/networkSecurityGroup.id'
                exists: 'false'
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