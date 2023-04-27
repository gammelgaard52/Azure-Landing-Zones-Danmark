targetScope = 'managementGroup'

param location string = deployment().location
param managementGroupId string
param userAssignedIdentity string

module ISO_27001_2013 '../../shared/policy-assignment.bicep' = {
  name: 'ISO-27001-2013-Assignment'
  scope: managementGroup(managementGroupId)
  params: {
    location: location
    policyAssignmentName: 'ISO-27001-2013'
    policyDefinitionId: tenantResourceId('Microsoft.Authorization/policySetDefinitions', '89c6cddc-1c73-4ac1-b19c-54d1a15a42f2')
    userAssignedIdentity: userAssignedIdentity
  }
}
