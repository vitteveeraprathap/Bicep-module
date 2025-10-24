param location string = 'southeastasia'
param prefix string
param environment string

// Build environment-specific names
var namePrefix = toLower('${environment}-${prefix}')

module app './modules/app.bicep' = {
  name: '${namePrefix}-app'
  params: {
    location: location
    namePrefix: namePrefix
  }
}

module storage './modules/storage.bicep' = {
  name: '${namePrefix}-storage'
  params: {
    location: location
    namePrefix: namePrefix
  }
}

module security './modules/security.bicep' = {
  name: '${namePrefix}-security'
  params: {
    location: location
    namePrefix: namePrefix
  }
}

module container './modules/container.bicep' = {
  name: '${namePrefix}-acr'
  params: {
    location: location
    namePrefix: namePrefix
  }
}

module monitoring './modules/monitoring.bicep' = {
  name: '${namePrefix}-log'
  params: {
    location: location
    namePrefix: namePrefix
  }
}

output webAppUrl string = app.outputs.webAppUrl
output storageAccountId string = storage.outputs.storageAccountId
output keyVaultId string = security.outputs.keyVaultId
output acrId string = container.outputs.acrId
output logAnalyticsId string = monitoring.outputs.logAnalyticsId
