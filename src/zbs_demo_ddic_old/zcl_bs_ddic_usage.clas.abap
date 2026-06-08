CLASS zcl_bs_ddic_usage DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    CONSTANTS:
      BEGIN OF actions,
        no_action   TYPE zbs_ddic_action VALUE '',
        enhancement TYPE zbs_ddic_action VALUE 'E',
        rollout     TYPE zbs_ddic_action VALUE 'R',
      END OF actions.

  PRIVATE SECTION.
    METHODS function_select
      IMPORTING !out TYPE REF TO if_oo_adt_classrun_out.

    METHODS function_compare
      IMPORTING !out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.


CLASS zcl_bs_ddic_usage IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    function_select( out ).
    function_compare( out ).
  ENDMETHOD.


  METHOD function_select.
    SELECT FROM zbs_ddic_table
      FIELDS *
      INTO TABLE @DATA(found_ddics).

    LOOP AT found_ddics INTO DATA(found_ddic).
      DATA(table_index) = sy-tabix.

      AUTHORITY-CHECK OBJECT 'ZBS_DDIC'
                      ID 'ACTVT' FIELD '03'
                      ID 'ZBSDDICACT' FIELD found_ddic-action.

      IF sy-subrc <> 0.
        DELETE found_ddics INDEX table_index.
      ENDIF.
    ENDLOOP.

    out->write( found_ddics ).
  ENDMETHOD.


  METHOD function_compare.
    DATA local_structure TYPE zbs_s_ddic_info.

    IF local_structure-action = actions-enhancement.
      out->write( local_structure ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
