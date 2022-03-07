@EndUserText.label: 'Get coordinates'
define table function Zcordinate_test
  with parameters
    p_long : abap.dec(15, 12 ),
    p_lat  : abap.dec( 15, 12 )
returns
{
  clent    : abap.clnt;
  geo_cord : abap.geom_ewkb; //abap.char( 100 );

}
implemented by method
  zcl_amdp_get_coord=>get_coordinates;