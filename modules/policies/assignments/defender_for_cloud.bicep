targetScope = 'managementGroup'

param location string = deployment().location
param managementGroupId string
param userAssignedIdentity string
param emailSecurityContact string

module Defender_For_Cloud '../../shared/policy-assignment.bicep' = {
  name: 'Defender-For-Cloud-Assignment'
  scope: managementGroup(managementGroupId)
  params: {
    location: location
    policyAssignmentName: 'Defender-For-Cloud'
    policyDefinitionId: extensionResourceId(managementGroup().id, 'Microsoft.Authorization/policySetDefinitions', 'Configure-Defender-For-Cloud')
    userAssignedIdentity: userAssignedIdentity
    parameters: {
      emailSecurityContact: {
        value: emailSecurityContact
      }
    }
  }
}
