// az account set --subscription "Sottoscrizione di Visual Studio Professional"
// az deployment group create --resource-group rg-bicep-townhall --template-file 6_1_Server_Dependant_Resources.bicep

//
// PARAMETERS
//
@description('The name of the SQL logical server.')
param serverName string = 'sql-server-townhall-bicep'

@description('Location for all resources.')
param location string = resourceGroup().location

@description('The administrator username of the SQL logical server.')
param administratorLogin string

@description('The administrator password of the SQL logical server.')
@secure()
param administratorLoginPassword string

//
// RESOURCES
//
resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: serverName
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
}
