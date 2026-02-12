-- ndb.depagenttypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.depagenttypes

CREATE TABLE IF NOT EXISTS ndb.depagenttypes (

    depagentid integer DEFAULT nextval('ndb.seq_depagenttypes_depagentid'::regclass) NOT NULL,
    depagent character varying(64) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.depagenttypes IS 'Lookup table of Depositional Agents. Table is referenced by the DepAgents table.';
COMMENT ON COLUMN ndb.depagenttypes.depagentid IS 'An arbitrary Depositional Agent identification number.';
COMMENT ON COLUMN ndb.depagenttypes.depagent IS 'Depositional Agent.';
COMMENT ON COLUMN ndb.depagenttypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.depagenttypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX depagenttypes_pkey ON ndb.depagenttypes USING btree (depagentid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.depagenttypes DROP CONSTRAINT IF EXISTS depagenttypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.depagenttypes ADD CONSTRAINT depagenttypes_pkey PRIMARY KEY (depagentid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.depagenttypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.depagenttypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.depagenttypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.depagenttypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n