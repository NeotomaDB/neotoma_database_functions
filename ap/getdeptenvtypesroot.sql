CREATE OR REPLACE FUNCTION ap.getdeptenvtypesroot()
 RETURNS TABLE(depenvtid integer, depenvt character varying, children bigint)
 LANGUAGE sql
AS $function$
WITH
nodes AS (
	SELECT det.depenvtid, det.depenvt
	FROM ndb.depenvttypes AS det 
	WHERE det.depenvthigherid = det.depenvtid
),
children AS (
	SELECT det.depenvthigherid, COUNT(det.depenvtid) AS children
	FROM ndb.depenvttypes AS det 
	WHERE det.depenvthigherid IN (SELECT depenvtid FROM nodes)
	GROUP BY depenvthigherid
)

SELECT n.depenvtid, n.depenvt, c.children
FROM nodes AS n LEFT JOIN
children AS c ON N.DEPENVTID = C.DEPENVTHIGHERID;
$function$
