@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_VEHICLE_RMR 
  as select from I_Currency
{
  key Currency,
      CurrencyISOCode
}





