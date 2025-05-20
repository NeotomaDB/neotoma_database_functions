CREATE OR REPLACE FUNCTION cron.schedule(schedule text, command text)
 RETURNS bigint
 LANGUAGE c
 STRICT
AS '$libdir/pg_cron', $function$cron_schedule$function$
