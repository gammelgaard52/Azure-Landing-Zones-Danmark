targetScope = 'managementGroup'

param location string = deployment().location
param managementGroupId string
param userAssignedIdentity string

module Azure_Security_Benchmark '../../shared/policy-assignment.bicep' = {
  name: 'Azure-Security-Benchmark-Assignment'
  scope: managementGroup(managementGroupId)
  params: {
    location: location
    policyAssignmentName: 'Azure_Security_Benchmark'
    policyDefinitionId: tenantResourceId('Microsoft.Authorization/policySetDefinitions', '1f3afdf9-d0c9-4c3d-847f-89da613e70a8')
    userAssignedIdentity: userAssignedIdentity
  }
}
