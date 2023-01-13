targetScope = 'managementGroup'

param location string = deployment().location
param managementGroupId string
param root string
param userAssignedIdentity string

module Cust_Regulate_Compliance '../../shared/policy-assignment.bicep' = {
  name: 'Cust-Regulate-Compliance-Assignment'
  scope: managementGroup(managementGroupId)
  params: {
    location: location
    policyAssignmentName: 'Cust-Regulate-Compliance'
    policyDefinitionId: extensionResourceId(resourceId('Microsoft.Management/managementGroups', root), 'Microsoft.Authorization/policySetDefinitions', 'Custom-Regulatory-Compliance')
    userAssignedIdentity: userAssignedIdentity
  }
}
