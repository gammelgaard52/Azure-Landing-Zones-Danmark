targetScope = 'managementGroup'

param location string = deployment().location
param managementGroupId string

module Configure_Storage_Security './../../../shared/policy-assignment.bicep' = {
  name: 'Configure-Storage-Security-Assignment'
  scope: managementGroup(managementGroupId)
  params: {
    location: location
    policyAssignmentName: 'Configure-Storage-Security'
    policyDefinitionId: extensionResourceId(managementGroup().id, 'Microsoft.Authorization/policySetDefinitions', 'Configure-Storage-Security')
  }
}
