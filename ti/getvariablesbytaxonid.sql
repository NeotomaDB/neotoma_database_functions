CREATE OR REPLACE FUNCTION ti.getvariablesbytaxonid(_taxonid integer)
 RETURNS TABLE(variableid integer, taxonid integer, variableelementid integer, variableunitsid integer, variablecontextid integer)
 LANGUAGE sql
AS $function$
SELECT     vr.variableid,
           vr.taxonid,
           vr.variableelementid,
           vr.variableunitsid,
           vr.variablecontextid
FROM         ndb.variables AS vr
WHERE     (vr.taxonid = $1)

$function$
