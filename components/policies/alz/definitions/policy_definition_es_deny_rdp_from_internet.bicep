targetScope = 'managementGroup'
resource Deny_RDP_From_Internet 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'Deny-RDP-From-Internet'
  properties: {
    policyType: 'Custom'
    mode: 'All'
    displayName: 'RDP access from the Internet should be blocked'
    description: 'This policy denies any network security rule that allows RDP access from Internet'
    metadata: {
      version: '1.0.0'
      category: 'Network'
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
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Network/networkSecurityGroups/securityRules'
          }
          {
            allOf: [
              {
                field: 'Microsoft.Network/networkSecurityGroups/securityRules/access'
                equals: 'Allow'
              }
              {
                field: 'Microsoft.Network/networkSecurityGroups/securityRules/direction'
                equals: 'Inbound'
              }
              {
                anyOf: [
                  {
                    field: 'Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRange'
                    equals: '*'
                  }
                  {
                    field: 'Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRange'
                    equals: '3389'
                  }
                  {
                    value: '[if(and(not(empty(field(\'Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRange\'))), contains(field(\'Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRange\'),\'-\')), and(lessOrEquals(int(first(split(field(\'Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRange\'), \'-\'))),3389),greaterOrEquals(int(last(split(field(\'Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRange\'), \'-\'))),3389)), \'false\')]'
                    equals: 'true'
                  }
                  {
                    count: {
                      field: 'Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRanges[*]'
                      where: {
                        value: '[if(and(not(empty(first(field(\'Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRanges[*]\')))), contains(first(field(\'Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRanges[*]\')),\'-\')), and(lessOrEquals(int(first(split(first(field(\'Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRanges[*]\')), \'-\'))),3389),greaterOrEquals(int(last(split(first(field(\'Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRanges[*]\')), \'-\'))),3389)) , \'false\')]'
                        equals: 'true'
                      }
                    }
                    greater: 0
                  }
                  {
                    not: {
                      field: 'Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRanges[*]'
                      notEquals: '*'
                    }
                  }
                  {
                    not: {
                      field: 'Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRanges[*]'
                      notEquals: '3389'
                    }
                  }
                ]
              }
              {
                anyOf: [
                  {
                    field: 'Microsoft.Network/networkSecurityGroups/securityRules/sourceAddressPrefix'
                    equals: '*'
                  }
                  {
                    field: 'Microsoft.Network/networkSecurityGroups/securityRules/sourceAddressPrefix'
                    equals: 'Internet'
                  }
                  {
                    not: {
                      field: 'Microsoft.Network/networkSecurityGroups/securityRules/sourceAddressPrefixes[*]'
                      notEquals: '*'
                    }
                  }
                  {
                    not: {
                      field: 'Microsoft.Network/networkSecurityGroups/securityRules/sourceAddressPrefixes[*]'
                      notEquals: 'Internet'
                    }
                  }
                ]
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