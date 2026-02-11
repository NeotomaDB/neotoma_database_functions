-- cron.job Table definition

-- Drop table

-- DROP TABLE IF EXISTS cron.job

CREATE TABLE IF NOT EXISTS cron.job (

    jobid bigint DEFAULT nextval('cron.jobid_seq'::regclass) NOT NULL,
    schedule text NOT NULL,
    command text NOT NULL,
    nodename text DEFAULT 'localhost'::text NOT NULL,
    nodeport integer DEFAULT inet_server_port() NOT NULL,
    database text DEFAULT current_database() NOT NULL,
    username text DEFAULT CURRENT_USER NOT NULL,
    active boolean DEFAULT true NOT NULL,
    jobname text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE cron.job IS "";

--- Table indices
CREATE UNIQUE INDEX job_pkey ON cron.job USING btree (jobid);
CREATE UNIQUE INDEX jobname_username_uniq ON cron.job USING btree (jobname, username)

--- Remove existing constraints if needed
-- ALTER TABLE cron.job DROP CONSTRAINT IF EXISTS job_pkey;
-- ALTER TABLE cron.job DROP CONSTRAINT IF EXISTS jobname_username_uniq;

--- Non-foreign key constraints
ALTER TABLE cron.job ADD CONSTRAINT job_pkey PRIMARY KEY (jobid);
ALTER TABLE cron.job ADD CONSTRAINT jobname_username_uniq UNIQUE (jobname, username);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS cron_job_cache_invalidate ON cron.job;
-- DROP TRIGGER IF EXISTS cron_job_cache_invalidate ON cron.job;
-- DROP TRIGGER IF EXISTS cron_job_cache_invalidate ON cron.job;
CREATE TRIGGER cron_job_cache_invalidate AFTER DELETE ON cron.job FOR EACH ROW EXECUTE FUNCTION cron.job_cache_invalidate();
CREATE TRIGGER cron_job_cache_invalidate AFTER INSERT ON cron.job FOR EACH ROW EXECUTE FUNCTION cron.job_cache_invalidate();
CREATE TRIGGER cron_job_cache_invalidate AFTER UPDATE ON cron.job FOR EACH ROW EXECUTE FUNCTION cron.job_cache_invalidate();