targetScope = 'managementGroup'
resource Deploy_Diagnostics_VNetGW 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'Deploy-Diagnostics-VNetGW'
  properties: {
    policyType: 'Custom'
    mode: 'Indexed'
    displayName: 'Deploy Diagnostic Settings for VPN Gateway to Log Analytics workspace'
    description: 'Deploys the diagnostic settings for VPN Gateway to stream to a Log Analytics workspace when any VPN Gateway which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled.'
    metadata: {
      version: '1.0.0'
      category: 'Monitoring'
    }
    parameters: {
      logAnalytics: {
        type: 'String'
        metadata: {
          displayName: 'Log Analytics workspace'
          description: 'Select Log Analytics workspace from dropdown list. If this workspace is outside of the scope of the assignment you must manually grant \'Log Analytics Contributor\' permissions (or similar) to the policy assignment\'s principal ID.'
          strongType: 'omsWorkspace'
        }
      }
      effect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Effect'
          description: 'Enable or disable the execution of the policy'
        }
      }
      profileName: {
        type: 'String'
        defaultValue: 'setbypolicy'
        metadata: {
          displayName: 'Profile name'
          description: 'The diagnostic settings profile name'
        }
      }
      metricsEnabled: {
        type: 'String'
        defaultValue: 'True'
        allowedValues: [
          'True'
          'False'
        ]
        metadata: {
          displayName: 'Enable metrics'
          description: 'Whether to enable metrics stream to the Log Analytics workspace - True or False'
        }
      }
      logsEnabled: {
        type: 'String'
        defaultValue: 'True'
        allowedValues: [
          'True'
          'False'
        ]
        metadata: {
          displayName: 'Enable logs'
          description: 'Whether to enable logs stream to the Log Analytics workspace - True or False'
        }
      }
    }
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.Network/virtualNetworkGateways'
      }
      then: {
        effect: '[parameters(\'effect\')]'
        details: {
          type: 'Microsoft.Insights/diagnosticSettings'
          name: 'setByPolicy'
          existenceCondition: {
            allOf: [
              {
                field: 'Microsoft.Insights/diagnosticSettings/logs.enabled'
                equals: 'true'
              }
              {
                field: 'Microsoft.Insights/diagnosticSettings/metrics.enabled'
                equals: 'true'
              }
              {
                field: 'Microsoft.Insights/diagnosticSettings/workspaceId'
                equals: '[parameters(\'logAnalytics\')]'
              }
            ]
          }
          roleDefinitionIds: [
            '/providers/microsoft.authorization/roleDefinitions/749f88d5-cbae-40b8-bcfc-e573ddc772fa'
            '/providers/microsoft.authorization/roleDefinitions/92aaf0da-9dab-42b6-94a3-d43ce8d16293'
          ]
          deployment: {
            properties: {
              mode: 'Incremental'
              template: {
                '$schema': 'http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#'
                contentVersion: '1.0.0.0'
                parameters: {
                  resourceName: {
                    type: 'String'
                  }
                  logAnalytics: {
                    type: 'String'
                  }
                  location: {
                    type: 'String'
                  }
                  profileName: {
                    type: 'String'
                  }
                  metricsEnabled: {
                    type: 'String'
                  }
                  logsEnabled: {
                    type: 'String'
                  }
                }
                variables: {
                }
                resources: [
                  {
                    type: 'Microsoft.Network/virtualNetworkGateways/providers/diagnosticSettings'
                    apiVersion: '2017-05-01-preview'
                    name: '[concat(parameters(\'resourceName\'), \'/\', \'Microsoft.Insights/\', parameters(\'profileName\'))]'
                    location: '[parameters(\'location\')]'
                    dependsOn: []
                    properties: {
                      workspaceId: '[parameters(\'logAnalytics\')]'
                      metrics: [
                        {
                          category: 'AllMetrics'
                          enabled: '[parameters(\'metricsEnabled\')]'
                          retentionPolicy: {
                            days: 0
                            enabled: false
                          }
                          timeGrain: null
                        }
                      ]
                      logs: [
                        {
                          category: 'GatewayDiagnosticLog'
                          enabled: '[parameters(\'logsEnabled\')]'
                        }
                        {
                          category: 'IKEDiagnosticLog'
                          enabled: '[parameters(\'logsEnabled\')]'
                        }
                        {
                          category: 'P2SDiagnosticLog'
                          enabled: '[parameters(\'logsEnabled\')]'
                        }
                        {
                          category: 'RouteDiagnosticLog'
                          enabled: '[parameters(\'logsEnabled\')]'
                        }
                        {
                          category: 'RouteDiagnosticLog'
                          enabled: '[parameters(\'logsEnabled\')]'
                        }
                        {
                          category: 'TunnelDiagnosticLog'
                          enabled: '[parameters(\'logsEnabled\')]'
                        }
                      ]
                    }
                  }
                ]
                outputs: {
                }
              }
              parameters: {
                logAnalytics: {
                  value: '[parameters(\'logAnalytics\')]'
                }
                location: {
                  value: '[field(\'location\')]'
                }
                resourceName: {
                  value: '[field(\'name\')]'
                }
                profileName: {
                  value: '[parameters(\'profileName\')]'
                }
                metricsEnabled: {
                  value: '[parameters(\'metricsEnabled\')]'
                }
                logsEnabled: {
                  value: '[parameters(\'logsEnabled\')]'
                }
              }
            }
          }
        }
      }
    }
  }
}