@ClientHandling.type: #CLIENT_DEPENDENT
@AbapCatalog.deliveryClass: #APPLICATION_DATA
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Table'
define table entity ZBS_CDSTable
{
  key Identifier   : ZBS_ST_CDSIdentifier;
      Description  : ZBS_ST_CDSDescription;
      SecondaryKey : ZBS_ST_CDSSecondary;
      @EndUserText.label: 'Counter for numbers'
      Counter      : abap.int4;
      ActionItem   : ZBS_SE_CDSActionItem;

      _Secondary   : association of exact one to one ZBS_CDSSecondaryTable on _Secondary.SecondaryKey = ZBS_CDSTable.SecondaryKey;
}
