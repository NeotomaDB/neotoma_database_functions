CREATE OR REPLACE FUNCTION ts.updatetaxonnotes(_taxonid integer, _notes character varying DEFAULT NULL::character varying)
 RETURNS void
 LANGUAGE sql
AS $function$
	UPDATE ndb.taxa AS ta
	SET    notes = _notes
	WHERE  ta.taxonid = _taxonid
$function$
