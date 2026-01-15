-- postgres_log definition

-- Drop table

-- DROP TABLE IF EXISTS postgres_log.postgres_log

CREATE TABLE postgres_log.postgres_log (
    log_time timestamp(3) with time zone NULL,
    user_name text NULL,
    database_name text NULL,
    process_id integer NULL,
    connection_from text NULL,
    session_id text NOT NULL,
    session_line_num bigint NOT NULL,
    command_tag text NULL,
    session_start_time timestamp with time zone NULL,
    virtual_transaction_id text NULL,
    transaction_id bigint NULL,
    error_severity text NULL,
    sql_state_code text NULL,
    message text NULL,
    detail text NULL,
    hint text NULL,
    internal_query text NULL,
    internal_query_pos integer NULL,
    context text NULL,
    query text NULL,
    query_pos integer NULL,
    location text NULL,
    application_name text NULL,
    CONSTRAINT postgres_log_pkey PRIMARY KEY (session_id, session_line_num)
);


-- adempiere.wmv_ghgaudit foreign keys

;