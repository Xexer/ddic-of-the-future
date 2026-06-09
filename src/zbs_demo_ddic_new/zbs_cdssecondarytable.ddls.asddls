@ClientHandling.type: #CLIENT_DEPENDENT
@AbapCatalog.deliveryClass: #APPLICATION_DATA
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Secondary Table'
define table entity ZBS_CDSSecondaryTable
{
  key SecondaryKey : ZBS_ST_CDSSecondary;
      Description  : ZBS_ST_CDSDescription;
}
