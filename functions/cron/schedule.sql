CREATE OR REPLACE FUNCTION cron.schedule(job_name text, schedule text, command text)
 RETURNS bigint
 LANGUAGE c
AS '$libdir/pg_cron', $function$cron_schedule_named$function$
