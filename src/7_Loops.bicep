// az account set --subscription "Sottoscrizione di Visual Studio Professional"
// az deployment group create --resource-group rg-bicep-townhall --template-file 7_Loops.bicep

//
// PARAMETERS
//
param myLocation string = resourceGroup().location
param storageNames array = [
  'first'
  'second'
  'skip'
  'third'
]

//
// RESOURCES
//
resource storageAcct 'Microsoft.Storage/storageAccounts@2021-06-01' = [for name in storageNames: if (name != 'skip') {
  name: 'st${name}townhallbicep'  // MUST BE UNIQUE
  location: myLocation
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'Storage'
}]
