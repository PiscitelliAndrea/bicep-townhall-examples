// az account set --subscription "Sottoscrizione di Visual Studio Professional"
// az deployment group create --resource-group rg-bicep-townhall --template-file .\1_Parameters.bicep
// az deployment group create --resource-group rg-bicep-townhall --template-file .\1_Parameters.bicep --parameters myStorageName=storagefortownhall

//
// PARAMETERS WITH ALLOWED VALUES
//
@allowed([
  'Standard_LRS'
  'Standard_GRS'
])
param mySku string = 'Standard_LRS'

@allowed([
  'FileStorage'
  'StorageV2'
  'BlobStorage'
])
param myKind string = 'StorageV2'

//
// PARAMETERS
//
@description('Please, provide Storage Account name')
param myStorageName string  // NO default value (mandatory)
param myLocation string = resourceGroup().location  // default value

//
// RESOURCES
//
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: myStorageName
  location: myLocation
  sku: {
    name: mySku
  }
  kind: myKind
  tags: {
    Project: 'Bicep Townhall'
    Owner: 'Piscitelli Andrea'
  }
}
