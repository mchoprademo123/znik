/********** GENERATED on 06/09/2021 at 18:48:46 by CB0000000372**************/
 @OData.entitySet.name: 'ZIMM_PurchaseOrderItemNote' 
 @OData.entityType.name: 'ZIMM_PurchaseOrderItemNoteType' 
 define root abstract entity ZZIMM_PURCHASEORDERITEMNOTE { 
 key PurchaseOrder : abap.char( 10 ) ; 
 key PurchaseOrderItem : abap.numc( 5 ) ; 
 key ArchitecturalObjectNumber : abap.char( 70 ) ; 
 key TechnicalObjectType : abap.char( 10 ) ; 
 key DocumentText : abap.char( 4 ) ; 
 key Language : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'NoteDescription_vc' 
 NoteDescription : abap.char( 1333 ) ; 
 NoteDescription_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FixedIndicator_vc' 
 FixedIndicator : abap.char( 1 ) ; 
 FixedIndicator_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreatedByUser_vc' 
 CreatedByUser : abap.char( 12 ) ; 
 CreatedByUser_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'success_message_vc' 
 success_message : abap.char( 255 ) ; 
 success_message_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'error_message_vc' 
 error_message : abap.char( 255 ) ; 
 error_message_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
