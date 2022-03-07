CLASS zcl_ce_http_po DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .

  PROTECTED SECTION.
    DATA purchaseorders TYPE STANDARD TABLE OF zcmm_purchaseord_ce.
  PRIVATE SECTION.
    METHODS get_http_client
      IMPORTING destination        TYPE string
      RETURNING VALUE(http_client) TYPE REF TO if_web_http_client
      RAISING
                cx_web_http_client_error
                cx_http_dest_provider_error.

    METHODS get_odata_response
      IMPORTING http_client TYPE REF TO if_web_http_client
                io_request  TYPE REF TO if_rap_query_request
      EXPORTING entityset   LIKE purchaseorders
      RAISING
                cx_web_http_client_error
                /iwbep/cx_gateway.
ENDCLASS.



CLASS ZCL_CE_HTTP_PO IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    DATA: lt_po TYPE STANDARD TABLE OF zcmm_purchaseord_ce.
    TRY.
        TRY.
            DATA(http_client) = get_http_client( destination = 'S4H_I338062' ).
          CATCH cx_web_http_client_error cx_http_dest_provider_error INTO DATA(error_creating_http_client).
            EXIT.
        ENDTRY.

        TRY.
            get_odata_response(
             EXPORTING http_client = http_client
                       io_request  = io_request
             IMPORTING entityset = lt_po ).
          CATCH cx_web_http_client_error /iwbep/cx_gateway INTO DATA(error_calling_OData_service).
            "handle exception

            EXIT.
        ENDTRY.

        IF lt_po IS NOT INITIAL.
          io_response->set_total_number_of_records( lines( lt_po ) ).
          io_response->set_data( lt_po ).
        ENDIF.
      CATCH cx_http_dest_provider_error INTO DATA(lx_dest).
    ENDTRY.

  ENDMETHOD.


  METHOD get_http_client.
    http_client = cl_web_http_client_manager=>create_by_http_destination(
         cl_http_destination_provider=>create_by_cloud_destination(
          i_name                  = destination
          i_authn_mode            = if_a4c_cp_service=>service_specific
         ) ).
  ENDMETHOD.


  METHOD get_odata_response.
    DATA entity                     LIKE LINE OF entityset.
    DATA range_for_purchaseorder    LIKE RANGE OF entity-PurchaseOrder.
    DATA range_for_purchaseorder2   LIKE RANGE OF entity-PurchaseOrder.
    DATA lo_filter                  TYPE REF TO /iwbep/if_cp_filter_node.
    DATA lo_requested_filter        TYPE REF TO if_rap_query_filter.

    IF io_request->is_data_requested( ).
      DATA(client_proxy) = cl_web_odata_client_factory=>create_v2_remote_proxy(
                                EXPORTING
                                  iv_service_definition_name = 'ZSCM_8062_PURCHORD'
                                  io_http_client             = http_client
                                  iv_relative_service_root   = '/sap/opu/odata/sap/ZMMGW_PURCHASE_ORDER_SRV/' ).

      DATA(odata_request) = client_proxy->create_resource_for_entity_set( 'ZCMM_PURCHASEORDER' )->create_request_for_read( ).

      DATA(order_by) = CORRESPONDING /iwbep/if_cp_runtime_types=>ty_t_sort_order(
                                                                    io_request->get_sort_elements(  )
                                                                    MAPPING property_path = element_name
                                                                    ).

* retrieve business data
      IF io_request->get_paging(  )->get_page_size( ) IS NOT INITIAL.
        odata_request->set_top(
         io_request->get_paging(  )->get_page_size( )
       ).
      ENDIF.
      odata_request->set_skip(
         COND #( WHEN io_request->get_paging(  )->get_offset(  ) > 0
                 THEN io_request->get_paging(  )->get_offset(  )
                 ELSE 0 )
      ).
      IF order_by IS NOT INITIAL.
        odata_request->set_orderby( order_by ).
      ENDIF.
      DATA(odata_response) = odata_request->execute(  ).
      odata_response->get_business_data( IMPORTING et_business_data = entityset ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
