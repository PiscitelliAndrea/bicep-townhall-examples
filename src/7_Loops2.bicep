// az account set --subscription "Sottoscrizione di Visual Studio Professional"
// az deployment group create --resource-group rg-bicep-townhall --template-file 7_Loops.bicep

//
// PARAMETERS
//
param myLocation string = resourceGroup().location
param myVnetName string = 'vnet-for-townhall-bicep'

//
// VARIABLES
//
var subnets = [
  {
    name: 'my-spoke-1'
    subnetPrefix: '10.144.0.0/24'
  }
  {
    name: 'my-spoke-2'
    subnetPrefix: '10.144.1.0/24'
  }
]

//
// RESOURCES
//
resource vnet 'Microsoft.Network/virtualNetworks@2020-07-01' = {
  name: myVnetName
  location: myLocation
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.144.0.0/20'
      ]
    }
    subnets: [for subnet in subnets: {
      name: subnet.name
      properties: {
        addressPrefix: subnet.subnetPrefix
      }
    }]
  }
}
