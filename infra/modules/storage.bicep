param location string
param namePrefix string

// Must be globally unique, lowercase, and no dashes
var storageAccountName = toLower(replace('${namePrefix}storage', '-', ''))

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}

output storageAccountId string = storage.id
output storageAccountName string = storage.name
