// az account set --subscription "Sottoscrizione di Visual Studio Professional"
// az deployment group create --resource-group rg-bicep-townhall --template-file 6_2_DB_Dependant_Resources.bicep

//
// PARAMETERS
//
@description('The name of the SQL logical server.')
param serverName string = 'sql-server-townhall-bicep'

@description('The name of the SQL Database.')
param sqlDBName string = 'TownHall-SampleDB'

@description('Location for all resources.')
param location string = resourceGroup().location

//
// RESOURCES
//
resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' existing = {
  name: serverName
}

resource sqlDB 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  parent: sqlServer
  name: sqlDBName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}
