CLASS zcl_8062_test_rfc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_8062_TEST_RFC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(lo_destination) = cl_rfc_destination_provider=>create_by_cloud_destination(
                             i_name                  = 'S4H_ON_PREM_RFC_NT'
                           ).

    DATA(lv_destination) = lo_destination->get_destination_name(  ).
    DATA: ls_return TYPE bapiret2.

*    CALL FUNCTION 'BAPI_MATERIAL_GET_DETAIL'  DESTINATION lv_destination      "Get the material detail
*        EXPORTING
*          material_long         = '000000000000000002'
**          plant                 =
**          valuationarea         =
*        IMPORTING
*          return                = ls_return
*          material_general_data = *
          .

  ENDMETHOD.
ENDCLASS.
