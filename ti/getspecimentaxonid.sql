CREATE OR REPLACE FUNCTION ti.getspecimentaxonid(_specimenid integer)
 RETURNS TABLE(taxonid integer)
 LANGUAGE sql
AS $function$

SELECT 	ndb.variables.taxonid 
FROM 	ndb.specimens INNER JOIN
		ndb.data on ndb.specimens.dataid = ndb.data.dataid INNER JOIN
		ndb.variables on ndb.data.variableid = ndb.variables.variableid
WHERE 	ndb.specimens.specimenid = $1

$function$
