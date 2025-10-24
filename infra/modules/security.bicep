param location string
param namePrefix string

var keyVaultName = toLower('${namePrefix}-keyvault')

resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableSoftDelete: true
    enableRbacAuthorization: true
    accessPolicies: []
  }
}

output keyVaultId string = keyVault.id
output keyVaultName string = keyVault.name
