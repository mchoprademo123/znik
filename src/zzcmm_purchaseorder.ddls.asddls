/********** GENERATED on 06/09/2021 at 18:48:45 by CB0000000372**************/
 @OData.entitySet.name: 'ZCMM_PURCHASEORDER' 
 @OData.entityType.name: 'ZCMM_PURCHASEORDERType' 
 define root abstract entity ZZCMM_PURCHASEORDER { 
 key PurchaseOrder : abap.char( 10 ) ; 
 @Odata.property.valueControl: 'CompanyCode_vc' 
 CompanyCode : abap.char( 4 ) ; 
 CompanyCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderType_vc' 
 PurchaseOrderType : abap.char( 4 ) ; 
 PurchaseOrderType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingDocumentDeletionC_vc' 
 PurchasingDocumentDeletionCode : abap.char( 1 ) ; 
 PurchasingDocumentDeletionC_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingProcessingStatus_vc' 
 PurchasingProcessingStatus : abap.char( 2 ) ; 
 PurchasingProcessingStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreatedByUser_vc' 
 CreatedByUser : abap.char( 12 ) ; 
 CreatedByUser_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LastChangeDateTime_vc' 
 LastChangeDateTime : tzntstmpl ; 
 LastChangeDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Supplier_vc' 
 Supplier : abap.char( 10 ) ; 
 Supplier_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderSubtype_vc' 
 PurchaseOrderSubtype : abap.char( 1 ) ; 
 PurchaseOrderSubtype_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Language_vc' 
 Language : abap.char( 2 ) ; 
 Language_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentTerms_vc' 
 PaymentTerms : abap.char( 4 ) ; 
 PaymentTerms_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CashDiscount1Days_vc' 
 CashDiscount1Days : abap.dec( 3, 0 ) ; 
 CashDiscount1Days_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CashDiscount2Days_vc' 
 CashDiscount2Days : abap.dec( 3, 0 ) ; 
 CashDiscount2Days_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'NetPaymentDays_vc' 
 NetPaymentDays : abap.dec( 3, 0 ) ; 
 NetPaymentDays_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CashDiscount1Percent_vc' 
 CashDiscount1Percent : abap.dec( 5, 3 ) ; 
 CashDiscount1Percent_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CashDiscount2Percent_vc' 
 CashDiscount2Percent : abap.dec( 5, 3 ) ; 
 CashDiscount2Percent_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingOrganization_vc' 
 PurchasingOrganization : abap.char( 4 ) ; 
 PurchasingOrganization_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingDocumentOrigin_vc' 
 PurchasingDocumentOrigin : abap.char( 1 ) ; 
 PurchasingDocumentOrigin_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingGroup_vc' 
 PurchasingGroup : abap.char( 3 ) ; 
 PurchasingGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderDate_vc' 
 PurchaseOrderDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 PurchaseOrderDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ExchangeRate_vc' 
 ExchangeRate : abap.char( 12 ) ; 
 ExchangeRate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ExchangeRateIsFixed_vc' 
 ExchangeRateIsFixed : abap_boolean ; 
 ExchangeRateIsFixed_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValidityStartDate_vc' 
 ValidityStartDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ValidityStartDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValidityEndDate_vc' 
 ValidityEndDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ValidityEndDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierQuotationExternalID_vc' 
 SupplierQuotationExternalID : abap.char( 10 ) ; 
 SupplierQuotationExternalID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierRespSalesPersonName_vc' 
 SupplierRespSalesPersonName : abap.char( 30 ) ; 
 SupplierRespSalesPersonName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplierPhoneNumber_vc' 
 SupplierPhoneNumber : abap.char( 16 ) ; 
 SupplierPhoneNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplyingSupplier_vc' 
 SupplyingSupplier : abap.char( 10 ) ; 
 SupplyingSupplier_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplyingPlant_vc' 
 SupplyingPlant : abap.char( 4 ) ; 
 SupplyingPlant_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IncotermsClassification_vc' 
 IncotermsClassification : abap.char( 3 ) ; 
 IncotermsClassification_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvoicingParty_vc' 
 InvoicingParty : abap.char( 10 ) ; 
 InvoicingParty_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ReleaseIsNotCompleted_vc' 
 ReleaseIsNotCompleted : abap_boolean ; 
 ReleaseIsNotCompleted_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingCompletenessStatu_vc' 
 PurchasingCompletenessStatus : abap_boolean ; 
 PurchasingCompletenessStatu_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IncotermsVersion_vc' 
 IncotermsVersion : abap.char( 4 ) ; 
 IncotermsVersion_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IncotermsLocation1_vc' 
 IncotermsLocation1 : abap.char( 70 ) ; 
 IncotermsLocation1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IncotermsLocation2_vc' 
 IncotermsLocation2 : abap.char( 70 ) ; 
 IncotermsLocation2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Country_vc' 
 Country : abap.char( 3 ) ; 
 Country_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PricingProcedure_vc' 
 PricingProcedure : abap.char( 6 ) ; 
 PricingProcedure_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_PoItem' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PoItem : association [0..*] to ZZCMM_PURCHORD_ITEM on 1 = 1; 
 } 
