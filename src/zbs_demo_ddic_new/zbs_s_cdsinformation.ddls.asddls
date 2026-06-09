@EndUserText.label: 'Information'
define abstract entity ZBS_S_CDSInformation
{
  Identifier  : ZBS_ST_CDSIdentifier;
  Description : ZBS_ST_CDSDescription;
  @EndUserText.label: 'Counter for numbers'
  Counter     : abap.int4;
  ActionItem  : ZBS_SE_CDSActionItem;
}
