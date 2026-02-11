CREATE OR REPLACE FUNCTION ap.updategpsites()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'ap', 'ndb', 'ts', 'ti', 'da', 'doi', 'pg_temp'
AS $function$
BEGIN
REFRESH MATERIALIZED VIEW CONCURRENTLY ap.geopolnames;
RETURN NULL;
END $function$
