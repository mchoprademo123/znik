@EndUserText.label: 'Custom Entity consuming the odata s4h'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_CE_HTTP_PO'
@UI: {
    headerInfo: {
        typeNamePlural: 'Orders'
    }
}
define custom entity ZCMM_PURCHASEORD_CE
{
    @UI: {lineItem: [{position: 10 }], selectionField: [{position: 10 }]}
  key PurchaseOrder                  : abap.char( 10 );
  
      CompanyCode                    : abap.char( 4 );
      
      PurchaseOrderType              : abap.char( 4 );
      
      PurchasingDocumentDeletionCode : abap.char( 1 );

      PurchasingProcessingStatus     : abap.char( 2 );

      CreatedByUser                  : abap.char( 12 );

      LastChangeDateTime             : tzntstmpl;

      Supplier                       : abap.char( 10 );

      PurchaseOrderSubtype           : abap.char( 1 );

      Language                       : abap.char( 2 );

      PaymentTerms                   : abap.char( 4 );

      CashDiscount1Days              : abap.dec( 3, 0 );

      CashDiscount2Days              : abap.dec( 3, 0 );

      NetPaymentDays                 : abap.dec( 3, 0 );

      CashDiscount1Percent           : abap.dec( 5, 3 );

      CashDiscount2Percent           : abap.dec( 5, 3 );

      PurchasingOrganization         : abap.char( 4 );

      PurchasingDocumentOrigin       : abap.char( 1 );

      PurchasingGroup                : abap.char( 3 );

      PurchaseOrderDate              : rap_cp_odata_v2_edm_datetime;

      ExchangeRate                   : abap.char( 12 );

      ExchangeRateIsFixed            : abap_boolean;

      ValidityStartDate              : rap_cp_odata_v2_edm_datetime;

      ValidityEndDate                : rap_cp_odata_v2_edm_datetime;

      SupplierQuotationExternalID    : abap.char( 10 );

      SupplierRespSalesPersonName    : abap.char( 30 );

      SupplierPhoneNumber            : abap.char( 16 );

      SupplyingSupplier              : abap.char( 10 );

      SupplyingPlant                 : abap.char( 4 );

      IncotermsClassification        : abap.char( 3 );

      InvoicingParty                 : abap.char( 10 );

      ReleaseIsNotCompleted          : abap_boolean;

      PurchasingCompletenessStatus   : abap_boolean;

      IncotermsVersion               : abap.char( 4 );

      IncotermsLocation1             : abap.char( 70 );

      IncotermsLocation2             : abap.char( 70 );

      Country                        : abap.char( 3 );

      PricingProcedure               : abap.char( 6 );
}
