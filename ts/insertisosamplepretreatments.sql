CREATE OR REPLACE FUNCTION ts.insertisosamplepretreatments(_dataid integer, _isopretreatmenttypeid integer, _order integer, _value double precision DEFAULT NULL::double precision)
 RETURNS void
 LANGUAGE sql
AS $function$
  INSERT INTO ndb.isosamplepretreatments(dataid, isopretreatmenttypeid, "order", value)
  VALUES (_dataid, _isopretreatmenttypeid, _order, _value)
$function$
