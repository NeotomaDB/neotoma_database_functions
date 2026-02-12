-- tmp.list_identities Table definition

-- Drop table

-- DROP TABLE IF EXISTS tmp.list_identities

CREATE TABLE IF NOT EXISTS tmp.list_identities (

    schema_name character varying(12) NULL,
    table_name character varying(256) NULL,
    column_name character varying(256) NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE tmp.list_identities IS '';
COMMENT ON COLUMN tmp.list_identities.schema_name IS '';
COMMENT ON COLUMN tmp.list_identities.table_name IS '';
COMMENT ON COLUMN tmp.list_identities.column_name IS '';

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints

--- Triggers