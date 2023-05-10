// az account set --subscription "Sottoscrizione di Visual Studio Professional"
// az deployment group create --resource-group rg-bicep-townhall --template-file 5_Conditional_Deployment.bicep

//
// PARAMETERS
//
@description('You really want to deploy a new Cosmos. Is it true?')
param reallyDeploy bool
param myLocation string = resourceGroup().location

//
// RESOURCES
//
resource myCosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-03-01-preview' = if (reallyDeploy) {
  name: 'townhall-cosmos-account'
  location: myLocation
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
          locationName: 'West Europe'
          failoverPriority: 0
          isZoneRedundant: false
      }
    ]
  }
}
