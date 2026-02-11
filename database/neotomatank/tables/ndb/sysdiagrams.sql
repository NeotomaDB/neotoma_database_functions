-- ndb.sysdiagrams Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.sysdiagrams

CREATE TABLE IF NOT EXISTS ndb.sysdiagrams (

    name character varying NOT NULL,
    principal_id integer NOT NULL,
    diagram_id integer DEFAULT nextval('ndb.seq_sysdiagrams_diagram_id'::regclass) NOT NULL,
    version integer NULL,
    definition bytea NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.sysdiagrams IS "";

--- Table indices
CREATE UNIQUE INDEX sysdiagrams_pkey ON ndb.sysdiagrams USING btree (diagram_id)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.sysdiagrams DROP CONSTRAINT IF EXISTS sysdiagrams_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.sysdiagrams ADD CONSTRAINT sysdiagrams_pkey PRIMARY KEY (diagram_id);

--- Foreign Key Restraints

--- Triggers