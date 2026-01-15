-- job_run_details definition

-- Drop table

-- DROP TABLE IF EXISTS job_run_details.job_run_details

CREATE TABLE job_run_details.job_run_details (
    jobid bigint NULL,
    runid bigint DEFAULT nextval('cron.runid_seq'::regclass) NOT NULL,
    job_pid integer NULL,
    database text NULL,
    username text NULL,
    command text NULL,
    status text NULL,
    return_message text NULL,
    start_time timestamp with time zone NULL,
    end_time timestamp with time zone NULL,
    CONSTRAINT job_run_details_pkey PRIMARY KEY (runid)
);


-- adempiere.wmv_ghgaudit foreign keys

;