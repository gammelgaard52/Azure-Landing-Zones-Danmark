targetScope = 'managementGroup'

param location string = deployment().location
param managementGroupId string

module Config_Storage_Security '../../../../shared/policy-assignment.bicep' = {
  name: 'Config-Storage-Security-Assignment'
  scope: managementGroup(managementGroupId)
  params: {
    location: location
    policyAssignmentName: 'Config-Storage-Security'
    policyDefinitionId: extensionResourceId(managementGroup().id, 'Microsoft.Authorization/policySetDefinitions', 'Configure-Storage-Security')
  }
}
