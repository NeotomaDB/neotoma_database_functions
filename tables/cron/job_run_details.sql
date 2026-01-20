-- cron definition

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


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE cron.job_run_details IS "";

--- Table indices
CREATE UNIQUE INDEX job_run_details_pkey ON cron.job_run_details USING btree (runid)

--- Remove existing constraints if needed
ALTER TABLE cron.job_run_details DROP CONSTRAINT IF EXISTS job_run_details_pkey;

--- Non-foreign key constraints
ALTER TABLE cron.job_run_details ADD CONSTRAINT job_run_details_pkey PRIMARY KEY (runid);

--- Foreign Key Restraints