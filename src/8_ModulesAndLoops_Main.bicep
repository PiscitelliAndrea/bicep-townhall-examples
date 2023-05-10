// az account set --subscription "Sottoscrizione di Visual Studio Professional"
// az deployment group create --resource-group rg-bicep-townhall --template-file 8_ModulesAndLoops_Main.bicep

//
// PARAMETERS
//
@description('Resources Group location')
param myLocation string = resourceGroup().location

//
// VARIABLES
//
var appServicePlanNames = [
  'example-plan-1'
  'example-plan-2'
]

var Kind = 'app'

//
// MODULES
//
module appServicePlanModule 'modules/8_Modules_AppServicePlanModule.bicep' = [for appServicePlanName in appServicePlanNames: {
  name: '${deployment().name}.${appServicePlanName}' // MUST BE UNIQUE
  params: {
    location: myLocation
    AppServicePlanName: appServicePlanName
    Kind: Kind
  }
}]
