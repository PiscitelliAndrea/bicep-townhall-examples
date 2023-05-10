// az account set --subscription "Sottoscrizione di Visual Studio Professional"
// az deployment group create --resource-group rg-bicep-townhall --template-file 8_Modules_Main.bicep

//
// PARAMETERS
//
@description('Resources Group location')
param myLocation string = resourceGroup().location

@description('Application ServicePlan Name, must be an unique string without spaces; max lenght is 40 characters')
@minLength(1)
@maxLength(40)
param appServicePlanName string

//
// VARIABLES
//
var Kind = 'app'

//
// MODULES
//
module appServicePlanModule 'modules/8_Modules_AppServicePlanModule.bicep' = {
  name: '${deployment().name}.planModule'
  params: {
    location: myLocation
    AppServicePlanName: appServicePlanName
    Kind: Kind
  }
}
