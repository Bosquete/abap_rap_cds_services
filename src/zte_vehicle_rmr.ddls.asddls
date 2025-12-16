@ClientHandling.type: #CLIENT_DEPENDENT
@AbapCatalog.deliveryClass: #APPLICATION_DATA
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vehicle persistence table for RAP demo'
define table entity ZTE_VEHICLE_RMR {
  key VehicleUUID   : abap.char(32);
      Brand         : abap.char(50);
      Model         : abap.char(50);
      VehicleType   : abap.char(10);
      CreatedAt     : timestampl;
      LastChangedAt : timestampl;
}
