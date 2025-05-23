CREATE OR REPLACE FUNCTION ts.updaterelativeage(_relativeageid integer, _relativeageunitid integer, _relativeagescaleid integer, _relativeage character varying, _c14ageyounger double precision DEFAULT NULL::double precision, _c14ageolder double precision DEFAULT NULL::double precision, _calageyounger double precision DEFAULT NULL::double precision, _calageolder double precision DEFAULT NULL::double precision, _notes character varying DEFAULT NULL::character varying)
 RETURNS void
 LANGUAGE sql
AS $function$
	UPDATE ndb.relativeages AS ra
	SET   relativeageunitid = _relativeageunitid,
        relativeagescaleid = _relativeagescaleid,
        relativeage = _relativeage,
        c14ageyounger = _c14ageyounger,
        c14ageolder = _c14ageolder,
        calageyounger = _calageyounger,
        calageolder = _calageolder, notes = _notes
	WHERE ra.relativeageid = _relativeageid
$function$
