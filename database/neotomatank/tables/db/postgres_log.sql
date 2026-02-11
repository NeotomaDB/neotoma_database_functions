-- db.postgres_log Table definition

-- Drop table

-- DROP TABLE IF EXISTS db.postgres_log

CREATE TABLE IF NOT EXISTS db.postgres_log (

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
    application_name text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE db.postgres_log IS "";

--- Table indices
CREATE UNIQUE INDEX postgres_log_pkey ON db.postgres_log USING btree (session_id, session_line_num)

--- Remove existing constraints if needed
-- ALTER TABLE db.postgres_log DROP CONSTRAINT IF EXISTS postgres_log_pkey;

--- Non-foreign key constraints
ALTER TABLE db.postgres_log ADD CONSTRAINT postgres_log_pkey PRIMARY KEY (session_id, session_line_num);

--- Foreign Key Restraints

--- Triggers