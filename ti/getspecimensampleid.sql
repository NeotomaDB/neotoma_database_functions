CREATE OR REPLACE FUNCTION ti.getspecimensampleid(_specimenid integer)
 RETURNS TABLE(sampleid integer)
 LANGUAGE sql
AS $function$

SELECT ndb.data.sampleid
FROM ndb.specimens INNER JOIN 
		ndb.data ON ndb.specimens.dataid = ndb.data.dataid
WHERE ndb.specimens.specimenid = $1

$function$
