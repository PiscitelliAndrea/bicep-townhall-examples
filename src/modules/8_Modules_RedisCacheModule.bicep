//
// PARAMETERS
//
@description('Resources Group location')
param location string

@description('Service Name, must be an unique string without spaces, max lenght is 255 characters')
@minLength(1)
@maxLength(63)
param redisCacheName string

param skuName string
param skuFamily string
param skuCapacity int

//
// RESOURCES
//
resource redisCache 'Microsoft.Cache/Redis@2022-05-01'  = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: skuName
      family: skuFamily
      capacity: skuCapacity
    }
  }
}
