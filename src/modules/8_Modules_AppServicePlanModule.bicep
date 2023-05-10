//
// PARAMETERS
//
@description('Resources Group location')
param location string

@description('Application ServicePlan Name, must be an unique string without spaces; max lenght is 40 characters')
@minLength(1)
@maxLength(40)
param AppServicePlanName string
param Kind string

//
// RESOURCES
//
resource applicationServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: AppServicePlanName
  location: location
  kind: Kind
}

