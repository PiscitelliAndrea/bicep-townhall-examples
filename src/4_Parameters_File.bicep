// az account set --subscription "Sottoscrizione di Visual Studio Professional"
// az deployment group create --resource-group rg-bicep-townhall --template-file 4_Parameters_File.bicep --parameters 4_Parameters_File-dev.parameters.json
// az deployment group create --resource-group rg-bicep-townhall --template-file 4_Parameters_File.bicep --parameters 4_Parameters_File-uat.parameters.json

//
// PARAMETERS WITH ALLOWED VALUES
//
@allowed([
  'FileStorage'
  'StorageV2'
  'BlobStorage'
])
param myKind string

@allowed([
  'dev'
  'uat'
  'production'
])
param environment string  // NO default value (mandatory)

//
// PARAMETERS
//
@description('Please, provide Prefix')
param prfx string         // NO default value (mandatory)
param myLocation string = resourceGroup().location  // default value

//
// VARIABLES
//
var myStorageName = '${toLower(prfx)}${uniqueString(resourceGroup().id)}${toLower(environment)}'
var mySku = (environment == 'dev') ? 'Standard_LRS' : 'Premium_LRS'

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
