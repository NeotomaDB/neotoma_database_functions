-- job definition

-- Drop table

-- DROP TABLE IF EXISTS job.job

CREATE TABLE job.job (
    jobid bigint DEFAULT nextval('cron.jobid_seq'::regclass) NOT NULL,
    schedule text NOT NULL,
    command text NOT NULL,
    nodename text DEFAULT 'localhost'::text NOT NULL,
    nodeport integer DEFAULT inet_server_port() NOT NULL,
    database text DEFAULT current_database() NOT NULL,
    username text DEFAULT CURRENT_USER NOT NULL,
    active boolean DEFAULT true NOT NULL,
    jobname text NULL,
    CONSTRAINT job_pkey PRIMARY KEY (jobid),
    CONSTRAINT jobname_username_uniq UNIQUE (jobname, username)
);


-- adempiere.wmv_ghgaudit foreign keys

;