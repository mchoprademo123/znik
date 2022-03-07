CLASS zcl_amdp_get_coord DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .
    CLASS-METHODS get_coordinates FOR TABLE FUNCTION Zcordinate_test.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_AMDP_GET_COORD IMPLEMENTATION.


  METHOD get_coordinates BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY.

*    declare lt_tab table ( clent "$ABAP.type( mandt )", geo_cord "$ABAP.type( geom_ewkb )" );
    declare a_1 "$ABAP.type( geom_ewkb )" array;
    declare a_2 "$ABAP.type( mandt )" array;

    a_2[ 1 ] = session_context('CLIENT');
    SELECT new st_point(:p_long, :p_lat).st_srid(4326) INTO a_1[ 1 ] FROM dummy;
*    //insert into :lt_tab values ( session_context('CLIENT'), select new st_point(:p_long, :p_lat).st_srid(4326) from dummy );

    itab =  unnest ( :a_2, :a_1 ) AS ( "CLENT", "GEO_CORD" );
    RETURN SELECT clent, geo_cord FROM :itab;

  ENDMETHOD.
ENDCLASS.
