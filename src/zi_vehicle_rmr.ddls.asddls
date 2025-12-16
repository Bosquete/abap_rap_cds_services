@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vehicle Root CDS'
define root view entity ZI_VEHICLE_RMR
  as select from ZTE_VEHICLE_RMR
{
  @UI.lineItem: [ { position: 10 } ]
  key VehicleUUID,

  @UI.lineItem: [ { position: 20 } ]
  Brand,

  @UI.lineItem: [ { position: 30 } ]
  Model,

  @UI.lineItem: [ { position: 40 } ]
  VehicleType as VehicleTypeCode,

  @UI.lineItem: [ { position: 50 } ]
  CreatedAt,

  LastChangedAt
}


