-- cron.job_run_details Table definition

-- Drop table

-- DROP TABLE IF EXISTS cron.job_run_details

CREATE TABLE IF NOT EXISTS cron.job_run_details (

    jobid bigint NULL,
    runid bigint DEFAULT nextval('cron.runid_seq'::regclass) NOT NULL,
    job_pid integer NULL,
    database text NULL,
    username text NULL,
    command text NULL,
    status text NULL,
    return_message text NULL,
    start_time timestamp with time zone NULL,
    end_time timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE cron.job_run_details IS '';
COMMENT ON COLUMN cron.job_run_details.jobid IS '';
COMMENT ON COLUMN cron.job_run_details.runid IS '';
COMMENT ON COLUMN cron.job_run_details.job_pid IS '';
COMMENT ON COLUMN cron.job_run_details.database IS '';
COMMENT ON COLUMN cron.job_run_details.username IS '';
COMMENT ON COLUMN cron.job_run_details.command IS '';
COMMENT ON COLUMN cron.job_run_details.status IS '';
COMMENT ON COLUMN cron.job_run_details.return_message IS '';
COMMENT ON COLUMN cron.job_run_details.start_time IS '';
COMMENT ON COLUMN cron.job_run_details.end_time IS '';

--- Table indices
CREATE UNIQUE INDEX job_run_details_pkey ON cron.job_run_details USING btree (runid)

--- Remove existing constraints if needed
-- ALTER TABLE cron.job_run_details DROP CONSTRAINT IF EXISTS job_run_details_pkey;

--- Non-foreign key constraints
ALTER TABLE cron.job_run_details ADD CONSTRAINT job_run_details_pkey PRIMARY KEY (runid);

--- Foreign Key Restraints

--- Triggers