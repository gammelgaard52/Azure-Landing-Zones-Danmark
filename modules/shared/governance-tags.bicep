targetScope = 'subscription'

param displayName string
param tags object = {}

resource tag 'Microsoft.Resources/tags@2021-04-01' = {
  name: displayName
  scope: subscription()
  properties: {
    tags: tags
  }
}
