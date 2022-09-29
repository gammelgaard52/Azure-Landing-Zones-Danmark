targetScope = 'managementGroup'
resource Deploy_Diagnostics_LogAnalytics 'Microsoft.Authorization/policySetDefinitions@2021-06-01' = {
  name: 'Deploy-Diagnostics-LogAnalytics'
  properties: {
    policyType: 'Custom'
    displayName: 'Deploy Diagnostic Settings to Azure Services'
    description: 'This policy set deploys the configurations of application Azure resources to forward diagnostic logs and metrics to an Azure Log Analytics workspace. See the list of policies of the services that are included '
    metadata: {
      version: '1.1.0'
      category: 'Monitoring'
    }
    parameters: {
      logAnalytics: {
        metadata: {
          description: 'Select Log Analytics workspace from dropdown list. If this workspace is outside of the scope of the assignment you must manually grant \'Log Analytics Contributor\' permissions (or similar) to the policy assignment\'s principal ID.'
          displayName: 'Log Analytics workspace'
          strongType: 'omsWorkspace'
        }
        type: 'String'
      }
      profileName: {
        type: 'String'
        defaultValue: 'setbypolicy'
        metadata: {
          displayName: 'Profile name'
          description: 'The diagnostic settings profile name'
        }
      }
      ACILogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Container Instances to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Container Instances to stream to a Log Analytics workspace when any ACR which is missing this diagnostic settings is created or updated. The Policy willset the diagnostic with all metrics enabled.'
        }
      }
      ACRLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Container Registry to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Container Registry to stream to a Log Analytics workspace when any ACR which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics  enabled.'
        }
      }
      AKSLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Kubernetes Service to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Kubernetes Service to stream to a Log Analytics workspace when any Kubernetes Service which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled.'
        }
      }
      AnalysisServiceLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Analysis Services to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Analysis Services to stream to a Log Analytics workspace when any Analysis Services which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      APIforFHIRLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Azure API for FHIR to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Azure API for FHIR to stream to a Log Analytics workspace when any Azure API for FHIR which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      APIMgmtLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for API Management to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for API Management to stream to a Log Analytics workspace when any API Management which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      ApplicationGatewayLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Application Gateway to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Application Gateway to stream to a Log Analytics workspace when any Application Gateway which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      AutomationLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Automation to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Automation to stream to a Log Analytics workspace when any Automation which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      BastionLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Azure Bastion to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Azure Bastion to stream to a Log Analytics workspace when any Bastion which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      BatchLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Batch to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Batch to stream to a Log Analytics workspace when any Batch which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      CDNEndpointsLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for CDN Endpoint to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for CDN Endpoint to stream to a Log Analytics workspace when any CDN Endpoint which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      CognitiveServicesLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Cognitive Services to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Cognitive Services to stream to a Log Analytics workspace when any Cognitive Services which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      CosmosLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Cosmos DB to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Cosmos DB to stream to a Log Analytics workspace when any Cosmos DB which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      DatabricksLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Databricks to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Databricks to stream to a Log Analytics workspace when any Databricks which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      DataExplorerClusterLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Azure Data Explorer Cluster to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Azure Data Explorer Cluster to stream to a Log Analytics workspace when any Azure Data Explorer Cluster which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      DataFactoryLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Data Factory to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Data Factory to stream to a Log Analytics workspace when any Data Factory which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      DataLakeStoreLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Azure Data Lake Store to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Azure Data Lake Store to stream to a Log Analytics workspace when anyAzure Data Lake Store which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      DataLakeAnalyticsLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Data Lake Analytics to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Data Lake Analytics to stream to a Log Analytics workspace when any Data Lake Analytics which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      EventGridSubLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Event Grid subscriptions to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Event Grid subscriptions to stream to a Log Analytics workspace when any Event Grid subscriptions which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      EventGridTopicLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Event Grid Topic to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Event Grid Topic to stream to a Log Analytics workspace when any Event Grid Topic which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      EventHubLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Event Hubs to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Event Hubs to stream to a Log Analytics workspace when any Event Hubs which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      EventSystemTopicLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Event Grid System Topic to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Event Grid System Topic to stream to a Log Analytics workspace when any Event Grid System Topic which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      ExpressRouteLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for ExpressRoute to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for ExpressRoute to stream to a Log Analytics workspace when any ExpressRoute which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      FirewallLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Firewall to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Firewall to stream to a Log Analytics workspace when any Firewall which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      FrontDoorLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Front Door to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Front Door to stream to a Log Analytics workspace when any Front Door which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      FunctionAppLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Azure Function App to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Azure Function App to stream to a Log Analytics workspace when any function app which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      HDInsightLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for HDInsight to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for HDInsight to stream to a Log Analytics workspace when any HDInsight which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      IotHubLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for IoT Hub to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for IoT Hub to stream to a Log Analytics workspace when any IoT Hub which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      KeyVaultLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Key Vault to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Key Vault to stream to a Log Analytics workspace when any Key Vault which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      LoadBalancerLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Load Balancer to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Load Balancer to stream to a Log Analytics workspace when any Load Balancer which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      LogicAppsISELogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Logic Apps integration service environment to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Logic Apps integration service environment to stream to a Log Analytics workspace when any Logic Apps integration service environment which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      LogicAppsWFLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Logic Apps Workflows to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Logic Apps Workflows to stream to a Log Analytics workspace when any Logic Apps Workflows which are missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      MariaDBLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for MariaDB to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for MariaDB to stream to a Log Analytics workspace when any MariaDB  which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      MediaServiceLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Azure Media Service to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Azure Media Service to stream to a Log Analytics workspace when any Azure Media Service which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      MlWorkspaceLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Machine Learning workspace to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Machine Learning workspace to stream to a Log Analytics workspace when any Machine Learning workspace which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      MySQLLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Database for MySQL to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Database for MySQL to stream to a Log Analytics workspace when any Database for MySQL which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      NetworkSecurityGroupsLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Network Security Groups to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Network Security Groups to stream to a Log Analytics workspace when any Network Security Groups which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      NetworkNICLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Network Interfaces to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Network Interfaces to stream to a Log Analytics workspace when any Network Interfaces which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      PostgreSQLLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Database for PostgreSQL to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Database for PostgreSQL to stream to a Log Analytics workspace when any Database for PostgreSQL which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      PowerBIEmbeddedLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Power BI Embedded to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Power BI Embedded to stream to a Log Analytics workspace when any Power BI Embedded which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      NetworkPublicIPNicLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Public IP addresses to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Public IP addresses to stream to a Log Analytics workspace when any Public IP addresses which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      RedisCacheLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Redis Cache to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Redis Cache to stream to a Log Analytics workspace when any Redis Cache which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      RelayLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Relay to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Relay to stream to a Log Analytics workspace when any Relay which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      SearchServicesLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Search Services to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Search Services to stream to a Log Analytics workspace when any Search Services which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      ServiceBusLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Service Bus namespaces  to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for ServiceBus to stream to a Log Analytics workspace when any ServiceBus which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      SignalRLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for SignalR to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for SignalR to stream to a Log Analytics workspace when any SignalR which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      SQLDBsLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for SQL Databases  to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for SQL Databases to stream to a Log Analytics workspace when any SQL Databases  which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      SQLElasticPoolsLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for SQL Elastic Pools to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for SQL Elastic Pools to stream to a Log Analytics workspace when any SQL Elastic Pools which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      SQLMLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for SQL Managed Instances to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for SQL Managed Instances to stream to a Log Analytics workspace when any SQL Managed Instances which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      StreamAnalyticsLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Stream Analytics to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Stream Analytics to stream to a Log Analytics workspace when any Stream Analytics which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      TimeSeriesInsightsLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Time Series Insights to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Time Series Insights to stream to a Log Analytics workspace when any Time Series Insights which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      TrafficManagerLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Traffic Manager to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Traffic Manager to stream to a Log Analytics workspace when any Traffic Manager which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      VirtualNetworkLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Virtual Network to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Virtual Network to stream to a Log Analytics workspace when any Virtual Network which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      VirtualMachinesLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Virtual Machines to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Virtual Machines to stream to a Log Analytics workspace when any Virtual Machines which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      VMSSLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Virtual Machine Scale Sets to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Virtual Machine Scale Sets  to stream to a Log Analytics workspace when any Virtual Machine Scale Sets  which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      VNetGWLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for VPN Gateway to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for VPN Gateway to stream to a Log Analytics workspace when any VPN Gateway which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled.'
        }
      }
      AppServiceLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for App Service Plan to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for App Service Plan to stream to a Log Analytics workspace when any App Service Plan which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      AppServiceWebappLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for App Service to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Web App to stream to a Log Analytics workspace when any Web App which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      AVDScalingPlansLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for AVD Scaling Plans to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for AVD Scaling Plans to stream to a Log Analytics workspace when any application groups which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      WVDAppGroupsLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for AVD Application Groups to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for AVD Application groups to stream to a Log Analytics workspace when any application groups which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      WVDWorkspaceLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for AVD Workspace to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for AVD Workspace to stream to a Log Analytics workspace when any Workspace which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      WVDHostPoolsLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for AVD Host pools to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for AVD Host pools to stream to a Log Analytics workspace when any host pool which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
      StorageAccountsLogAnalyticsEffect: {
        type: 'String'
        defaultValue: 'DeployIfNotExists'
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        metadata: {
          displayName: 'Deploy Diagnostic Settings for Storage Accounts to Log Analytics workspace'
          description: 'Deploys the diagnostic settings for Storage Accounts to stream to a Log Analytics workspace when any storage account which is missing this diagnostic settings is created or updated. The Policy will set the diagnostic with all metrics and category enabled'
        }
      }
    }
    policyDefinitions: [
      {
        policyDefinitionReferenceId: 'StorageAccountDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/6f8f98a4-f108-47cb-8e98-91a0d85cd474'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'StorageAccountsLogAnalyticsEffect\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'AVDScalingPlansDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AVDScalingPlans'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'AVDScalingPlansLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'WVDAppGroupDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WVDAppGroup'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'WVDAppGroupsLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'WVDWorkspaceDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WVDWorkspace'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'WVDWorkspaceLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'WVDHostPoolsDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WVDHostPools'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'WVDHostPoolsLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'ACIDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ACI'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'ACILogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'ACRDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ACR'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'ACRLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'AKSDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/6c66c325-74c8-42fd-a286-a74b0e2939d8'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'AKSLogAnalyticsEffect\')]'
          }
          diagnosticsSettingNameToUse: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'AnalysisServiceDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AnalysisService'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'AnalysisServiceLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'APIforFHIRDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ApiForFHIR'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'APIforFHIRLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'APIMgmtDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-APIMgmt'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'APIMgmtLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'ApplicationGatewayDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ApplicationGateway'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'ApplicationGatewayLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'AutomationDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AA'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'AutomationLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'BastionDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Bastion'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'BastionLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'BatchDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/c84e5349-db6d-4769-805e-e14037dab9b5'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'BatchLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'CDNEndpointsDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CDNEndpoints'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'CDNEndpointsLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'CognitiveServicesDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CognitiveServices'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'CognitiveServicesLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'CosmosDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CosmosDB'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'CosmosLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'DatabricksDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Databricks'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'DatabricksLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'DataExplorerClusterDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataExplorerCluster'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'DataExplorerClusterLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'DataFactoryDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataFactory'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'DataFactoryLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'DataLakeStoreDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/d56a5a7c-72d7-42bc-8ceb-3baf4c0eae03'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'DataLakeStoreLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'DataLakeAnalyticsDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DLAnalytics'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'DataLakeAnalyticsLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'EventGridSubDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridSub'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'EventGridSubLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'EventGridTopicDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridTopic'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'EventGridTopicLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'EventHubDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/1f6e93e8-6b31-41b1-83f6-36e449a42579'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'EventHubLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'EventSystemTopicDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridSystemTopic'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'EventSystemTopicLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'ExpressRouteDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ExpressRoute'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'ExpressRouteLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'FirewallDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Firewall'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'FirewallLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'FrontDoorDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-FrontDoor'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'FrontDoorLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'FunctionAppDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Function'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'FunctionAppLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'HDInsightDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-HDInsight'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'HDInsightLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'IotHubDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-iotHub'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'IotHubLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'KeyVaultDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/bef3f64c-5290-43b7-85b0-9b254eef4c47'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'KeyVaultLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'LoadBalancerDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LoadBalancer'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'LoadBalancerLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'LogicAppsISEDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LogicAppsISE'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'LogicAppsISELogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'LogicAppsWFDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/b889a06c-ec72-4b03-910a-cb169ee18721'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'LogicAppsWFLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'MariaDBDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MariaDB'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'MariaDBLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'MediaServiceDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MediaService'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'MediaServiceLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'MlWorkspaceDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MlWorkspace'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'MlWorkspaceLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'MySQLDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MySQL'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'MySQLLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'NetworkSecurityGroupsDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-NetworkSecurityGroups'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'NetworkSecurityGroupsLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'NetworkNICDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-NIC'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'NetworkNICLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'PostgreSQLDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PostgreSQL'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'PostgreSQLLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'PowerBIEmbeddedDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PowerBIEmbedded'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'PowerBIEmbeddedLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'NetworkPublicIPNicDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/752154a7-1e0f-45c6-a880-ac75a7e4f648'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'NetworkPublicIPNicLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
          metricsEnabled: {
            value: 'True'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'RecoveryVaultDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/c717fb0c-d118-4c43-ab3d-ece30ac81fb3'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'RedisCacheDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-RedisCache'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'RedisCacheLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'RelayDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Relay'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'RelayLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'SearchServicesDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/08ba64b8-738f-4918-9686-730d2ed79c7d'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'SearchServicesLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'ServiceBusDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/04d53d87-841c-4f23-8a5b-21564380b55e'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'ServiceBusLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'SignalRDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SignalR'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'SignalRLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'SQLDatabaseDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/b79fa14e-238a-4c2d-b376-442ce508fc84'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'SQLDBsLogAnalyticsEffect\')]'
          }
          diagnosticsSettingNameToUse: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'SQLElasticPoolsDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLElasticPools'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'SQLElasticPoolsLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'SQLMDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLMI'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'SQLMLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'StreamAnalyticsDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/237e0f7e-b0e8-4ec4-ad46-8c12cb66d673'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'StreamAnalyticsLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'TimeSeriesInsightsDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TimeSeriesInsights'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'TimeSeriesInsightsLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'TrafficManagerDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TrafficManager'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'TrafficManagerLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'VirtualNetworkDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VirtualNetwork'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'VirtualNetworkLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'VirtualMachinesDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VM'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'VirtualMachinesLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'VMSSDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VMSS'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'VMSSLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'VNetGWDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VNetGW'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'VNetGWLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'AppServiceDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WebServerFarm'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'AppServiceLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
      {
        policyDefinitionReferenceId: 'AppServiceWebappDeployDiagnosticLogDeployLogAnalytics'
        policyDefinitionId: '\${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Website'
        parameters: {
          logAnalytics: {
            value: '[[parameters(\'logAnalytics\')]'
          }
          effect: {
            value: '[[parameters(\'AppServiceWebappLogAnalyticsEffect\')]'
          }
          profileName: {
            value: '[[parameters(\'profileName\')]'
          }
        }
        groupNames: []
      }
    ]
    policyDefinitionGroups: null
  }
}