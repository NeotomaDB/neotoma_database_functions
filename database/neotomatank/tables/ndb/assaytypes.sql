-- ndb.assaytypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.assaytypes

CREATE TABLE IF NOT EXISTS ndb.assaytypes (

    assaytypeid integer DEFAULT nextval('ndb.assaytypes_assaytypeid_seq'::regclass) NOT NULL,
    assaytype text NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.assaytypes IS '';
COMMENT ON COLUMN ndb.assaytypes.assaytypeid IS '';
COMMENT ON COLUMN ndb.assaytypes.assaytype IS '';
COMMENT ON COLUMN ndb.assaytypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.assaytypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX assaytypes_pkey ON ndb.assaytypes USING btree (assaytypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.assaytypes DROP CONSTRAINT IF EXISTS assaytypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.assaytypes ADD CONSTRAINT assaytypes_pkey PRIMARY KEY (assaytypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_assaytypes_createdate ON ndb.assaytypes;\n
-- DROP TRIGGER IF EXISTS tr_assaytypes_modifydate ON ndb.assaytypes;\n
-- DROP TRIGGER IF EXISTS tr_assaytypes_modifydate ON ndb.assaytypes;\n
CREATE TRIGGER tr_assaytypes_createdate BEFORE INSERT ON ndb.assaytypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();\n
CREATE TRIGGER tr_assaytypes_modifydate BEFORE INSERT ON ndb.assaytypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_assaytypes_modifydate BEFORE UPDATE ON ndb.assaytypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n