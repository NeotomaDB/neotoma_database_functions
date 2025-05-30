CREATE OR REPLACE FUNCTION ti.getcontactstable()
 RETURNS TABLE(contactid integer, aliasid integer, contactname character varying, contactstatusid integer, familyname character varying, leadinginitials character varying, givennames character varying, suffix character varying, title character varying, phone character varying, fax character varying, email character varying, url character varying, address text, notes text, recdatecreated timestamp without time zone, recdatemodified timestamp without time zone)
 LANGUAGE sql
AS $function$
SELECT *
FROM ndb.contacts;
$function$
