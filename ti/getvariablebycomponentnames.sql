CREATE OR REPLACE FUNCTION ti.getvariablebycomponentnames(_taxon character varying, _element character varying DEFAULT NULL::character varying, _units character varying DEFAULT NULL::character varying, _context character varying DEFAULT NULL::character varying)
 RETURNS TABLE(variableid integer)
 LANGUAGE sql
AS $function$
  SELECT
    vr.variableid
  FROM
    ndb.variables AS vr
    INNER JOIN            ndb.taxa AS tx ON           vr.taxonid = tx.taxonid
    LEFT JOIN ndb.variablecontexts AS vc ON vr.variablecontextid = vc.variablecontextid
    LEFT JOIN    ndb.variableunits AS vu ON   vr.variableunitsid = vu.variableunitsid
    LEFT JOIN ndb.variableelements AS ve ON vr.variableelementid = ve.variableelementid
  WHERE
      (tx.taxonname ILIKE _taxon) AND
    ((_element IS NULL AND ve.variableelement IS NULL) OR (ve.variableelement ILIKE _element)) AND
      ((_units IS NULL AND vu.variableunits IS NULL) OR (vu.variableunits ILIKE _units)) AND
    ((_context IS NULL AND vc.variablecontext IS NULL) OR (vc.variablecontext ILIKE _context))
$function$
