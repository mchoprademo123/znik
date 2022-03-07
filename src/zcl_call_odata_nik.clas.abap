CLASS zcl_call_odata_nik DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
    DATA purchaseorders TYPE STANDARD TABLE OF zzcmm_purchaseorder.
  PRIVATE SECTION.

    METHODS get_http_client
      IMPORTING destination        TYPE string
      RETURNING VALUE(http_client) TYPE REF TO if_web_http_client
      RAISING
                cx_web_http_client_error
                cx_http_dest_provider_error.

    METHODS get_odata_response
      IMPORTING http_client TYPE REF TO if_web_http_client
      EXPORTING entityset   LIKE purchaseorders
      RAISING
                cx_web_http_client_error
                /iwbep/cx_gateway.

ENDCLASS.



CLASS ZCL_CALL_ODATA_NIK IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TRY.
        DATA(http_client) = get_http_client( destination = 'S4H_HTTPMC' ).
      CATCH cx_web_http_client_error cx_http_dest_provider_error INTO DATA(error_creating_http_client).
        out->write( error_creating_http_client->get_longtext(  )  ).
        EXIT.
    ENDTRY.

    TRY.
        get_odata_response(
         EXPORTING http_client = http_client
         IMPORTING entityset = DATA(purchaseorders) ).
      CATCH cx_web_http_client_error /iwbep/cx_gateway INTO DATA(error_calling_OData_service).
        "handle exception
        out->write( error_calling_OData_service->get_longtext(  )  ).
        EXIT.
    ENDTRY.

    LOOP AT purchaseorders INTO DATA(purchaseorder).
      out->write( purchaseorder ).
    ENDLOOP.

  ENDMETHOD.


  METHOD get_http_client.

    http_client = cl_web_http_client_manager=>create_by_http_destination(
         cl_http_destination_provider=>create_by_cloud_destination(
          i_name                  = destination
          i_authn_mode            = if_a4c_cp_service=>service_specific
         )
         ).
  ENDMETHOD.


  METHOD get_odata_response.

    DATA entity LIKE LINE OF entityset.
    DATA range_for_purchaseorder LIKE RANGE OF entity-PurchaseOrder.
    DATA range_for_purchaseorder2 LIKE RANGE OF entity-PurchaseOrder.
*    DATA range_for_netamounts LIKE RANGE OF entity-net.
*    DATA range_for_netamounts2 LIKE RANGE OF entity-netamountintransactioncurrency.
    DATA(client_proxy) = cl_web_odata_client_factory=>create_v2_remote_proxy(
      EXPORTING
        iv_service_definition_name = 'ZSCM_8062_PURCHORD'
        io_http_client             = http_client
        iv_relative_service_root   = '/sap/opu/odata/sap/ZMMGW_PURCHASE_ORDER_SRV/' ).

    DATA(odata_request) = client_proxy->create_resource_for_entity_set( 'ZCMM_PURCHASEORDER' )->create_request_for_read( ).

    odata_request->set_top( 5 )->set_skip( 0 ).

* filter
    range_for_purchaseorder = VALUE #(
      ( sign = 'I' option = 'EQ' low = '4700000001' ) ).
*    range_for_netamounts = VALUE #(
*      ( sign = 'I' option = 'LE' low = '8000' ) ).
*    range_for_netamounts2 = VALUE #(
*      ( sign = 'I' option = 'GE' low = '3000' ) ).
    DATA(filter_factory) = odata_request->create_filter_factory( ).
    DATA(filter_child_node_1)  = filter_factory->create_by_range( iv_property_path     = 'PURCHASEORDER'
                                                                  it_range             = range_for_purchaseorder ).
*    DATA(filter_child_node_2)  = filter_factory->create_by_range( iv_property_path     = 'NETAMOUNTINTRANSACTIONCURRENCY'
*                                                                  it_range             = range_for_netamounts
*                                                                  iv_currency_code     = 'USD' ).
*    DATA(filter_child_node_3)  = filter_factory->create_by_range( iv_property_path     = 'NETAMOUNTINTRANSACTIONCURRENCY'
*                                                                  it_range             = range_for_netamounts2
*                                                                  iv_currency_code     = 'USD' ).
    DATA(filter_root_node) = filter_child_node_1. "->and( filter_child_node_2->and( filter_child_node_3 ) ).
    odata_request->set_filter( filter_root_node ).

* retrieve business data
    DATA(odata_response) = odata_request->execute( ).
    odata_response->get_business_data( IMPORTING et_business_data = entityset ).

  ENDMETHOD.
ENDCLASS.
