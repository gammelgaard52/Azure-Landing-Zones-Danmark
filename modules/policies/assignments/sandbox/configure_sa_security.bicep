targetScope = 'managementGroup'

param location string = deployment().location
param managementGroupId string
param root string
param userAssignedIdentity string

module Configure_SA_Security '../../../shared/policy-assignment.bicep' = {
  name: 'Configure-SA-Security-Assignment'
  scope: managementGroup(managementGroupId)
  params: {
    location: location
    policyAssignmentName: 'Configure-SA-Security'
    policyDefinitionId: extensionResourceId(resourceId('Microsoft.Management/managementGroups', root), 'Microsoft.Authorization/policySetDefinitions', 'Configure-Storage-Security')
    userAssignedIdentity: userAssignedIdentity
  }
}
