CREATE OR REPLACE FUNCTION ti.getvariablebycomponents(_taxonid integer, _variableelementid integer DEFAULT NULL::integer, _variableunitsid integer DEFAULT NULL::integer, _variablecontextid integer DEFAULT NULL::integer)
 RETURNS TABLE(variableid integer, taxonid integer, variableelementid integer, variableunitsid integer, variablecontextid integer)
 LANGUAGE sql
AS $function$
  SELECT
           vr.variableid,
              vr.taxonid,
    vr.variableelementid,
      vr.variableunitsid,
    vr.variablecontextid
  FROM
    ndb.variables AS vr
  WHERE
              (           vr.taxonid = _taxonid)           AND
    ((_variableelementid IS NULL AND vr.variableelementid IS NULL) OR (vr.variableelementid = _variableelementid)) AND
      ((_variableunitsid IS NULL AND vr.variableunitsid IS NULL) OR (vr.variableunitsid = _variableunitsid))   AND
    ((_variablecontextid IS NULL AND vr.variablecontextid IS NULL) OR (vr.variablecontextid = _variablecontextid))
$function$
