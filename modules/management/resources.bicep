targetScope = 'managementGroup'

param location string = deployment().location
param managementSubscriptionId string
param resourceGroupName string
param automationAccountName string
param ddosPlanName string
param storageAccountName string
param userAssignedIdentityName string
param workspaceName string
param initialAdminObjectIds array
param managedHSMName string

module group '../shared/resource-group.bicep' = {
  scope: subscription(managementSubscriptionId)
  name: 'resource-group-${uniqueString(resourceGroupName)}'
  params: {
    location: location
    resourceGroupName: resourceGroupName
  }
}

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' existing = {
  scope: subscription(managementSubscriptionId)
  name: group.name
}

module automationAccount '../shared/automation-account.bicep' = {
  scope: resourceGroup(managementSubscriptionId,rg.name)
  name: 'automation-account-${uniqueString(rg.name, automationAccountName)}'
  params: {
    location: location
    automationAccountName: storageAccountName
    skuName: 'Basic'
  }
}

module ddosProtectionPlan '../shared/ddos-protection-plan.bicep' = if (false) {
  scope: resourceGroup(managementSubscriptionId,rg.name)
  name: 'ddos-protection-plan-${uniqueString(rg.name, ddosPlanName)}'
  params: {
    location: location
    ddosPlanName: ddosPlanName
  }
}

module storageAccount '../shared/storage-account.bicep' = {
  scope: resourceGroup(managementSubscriptionId,rg.name)
  name: 'storage-account-${uniqueString(rg.name, storageAccountName)}'
  params: {
    location: location
    storageAccountName: storageAccountName
    skuName: 'Standard_RAGRS'
  }
}

module userAssignedIdentity '../shared/user-assigned-identity.bicep' = {
  scope: resourceGroup(managementSubscriptionId,rg.name)
  name: 'user-assigned-identity-${uniqueString(rg.name, userAssignedIdentityName)}'
  params: {
    location: location
    identityName: userAssignedIdentityName
  }
}

module userAssignedIdentityRoleAssignment '../shared/management-group-role-assignment.bicep' = {
  name: 'management-group-role-assignment-${uniqueString(managementGroup().id, userAssignedIdentity.name)}'
  params: {
    principalId: userAssignedIdentity.outputs.principalId
    principalType: 'ServicePrincipal'
    roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635'
  }
}

module workspace '../shared/log-analytics-workspace.bicep' = {
  scope: resourceGroup(managementSubscriptionId,rg.name)
  name: 'log-analytics-workspace-${uniqueString(rg.name, workspaceName)}'
  params: {
    location: location
    workspaceName: workspaceName
  }
}

var solutions = [
  'AgentHealthAssessment'
  'AzureActivity'
  'ChangeTracking'
  'Security'
  'SecurityInsights'
  'ServiceMap'
  'SQLAdvancedThreatProtection'
  'SQLAssessment'
  'SQLVulnerabilityAssessment'
  'Updates'
  'VMInsights'
]

module solution '../shared/log-analytics-workspace-solution.bicep' = [for solution in solutions: {
  scope: resourceGroup(managementSubscriptionId,rg.name)
  name: 'log-analytics-workspace-solution-${uniqueString(rg.name, workspace.name, solution)}'
  params: {
    location: location
    logAnalyticsWorkspaceName: workspace.name
    solutionName: solution
  }
}]

module managedKeyvaultHsm '../shared/managed-kv-hsm.bicep' = {
  scope: resourceGroup(managementSubscriptionId,rg.name)
  name: 'managed-kv-hsm-${uniqueString(rg.name, managedHSMName)}'
  params: {
    location: location
    initialAdminObjectIds: initialAdminObjectIds
    managedHSMName: managedHSMName
  }
}
