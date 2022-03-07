CLASS zcl_insertdata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INSERTDATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA v_guid TYPE sysuuid_x16.
**    CALL FUNCTION 'GUID_CREATE'
**        IMPORTING
**            ev_guid_16 = v_guid               " guid_16       GUID of length 16 (RAW  Format)
**      .
*    INSERT zcordinates FROM TABLE @( VALUE #(
*        ( mandt = '100'
*            guid = '0000000001'
*            street = 'Kanleta'
*            house_num = '111'
*            post_code = '123456'
*            city = 'Shimla'
*            longitude = '77.7777'
*            latitude = '31.2869'
*        )
*        ( mandt = '100'
*            guid = '0000000002'
*            street = 'Kanbog'
*            house_num = '111'
*            post_code = '123457'
*            city = 'Shimla'
*            longitude = '77.686'
*            latitude = '31.299'
*        )
*        ) ).
    "enter geocoordinates in or around Cologne, Germany\

  ENDMETHOD.
ENDCLASS.
