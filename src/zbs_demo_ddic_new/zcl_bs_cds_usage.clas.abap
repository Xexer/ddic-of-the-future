CLASS zcl_bs_cds_usage DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS function_select
      IMPORTING !out TYPE REF TO if_oo_adt_classrun_out.

    METHODS function_compare
      IMPORTING !out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.


CLASS zcl_bs_cds_usage IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    function_select( out ).
    function_compare( out ).
  ENDMETHOD.


  METHOD function_select.
    SELECT FROM ZBS_CDSTable
      FIELDS *
      INTO TABLE @DATA(found_ddics).

    out->write( found_ddics ).
  ENDMETHOD.


  METHOD function_compare.
    DATA local_structure TYPE ZBS_S_CDSInformation.

    IF local_structure-ActionItem = ZBS_SE_CDSActionItem-enhancement.
      out->write( local_structure ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
