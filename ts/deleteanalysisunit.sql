CREATE OR REPLACE FUNCTION ts.deleteanalysisunit(_analunitid integer)
 RETURNS void
 LANGUAGE sql
AS $function$
  DELETE FROM ndb.samples AS sm
  WHERE sm.analysisunitid = _analunitid;

  DELETE FROM ndb.analysisunits AS au
  WHERE au.analysisunitid = _analunitid;
$function$
