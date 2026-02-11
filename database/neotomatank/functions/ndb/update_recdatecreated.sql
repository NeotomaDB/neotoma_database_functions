CREATE OR REPLACE FUNCTION ndb.update_recdatecreated()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

BEGIN 
	NEW.recdatecreated = (current_timestamp at time zone 'UTC'); 
	Return NEW; 
END
 

$function$
