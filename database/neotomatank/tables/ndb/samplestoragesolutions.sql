-- ndb.samplestoragesolutions Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.samplestoragesolutions

CREATE TABLE IF NOT EXISTS ndb.samplestoragesolutions (

    samplestoragesolutionid integer DEFAULT nextval('ndb.samplestoragesolutions_samplestoragesolutionid_seq'::regclass) NOT NULL,
    samplestoragesolution text NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.samplestoragesolutions IS '';
COMMENT ON COLUMN ndb.samplestoragesolutions.samplestoragesolutionid IS '';
COMMENT ON COLUMN ndb.samplestoragesolutions.samplestoragesolution IS '';
COMMENT ON COLUMN ndb.samplestoragesolutions.recdatecreated IS '';
COMMENT ON COLUMN ndb.samplestoragesolutions.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX samplestoragesolutions_pkey ON ndb.samplestoragesolutions USING btree (samplestoragesolutionid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.samplestoragesolutions DROP CONSTRAINT IF EXISTS samplestoragesolutions_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.samplestoragesolutions ADD CONSTRAINT samplestoragesolutions_pkey PRIMARY KEY (samplestoragesolutionid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_samplestoragesolutions_createdate ON ndb.samplestoragesolutions;\n
-- DROP TRIGGER IF EXISTS tr_samplestoragesolutions_modifydate ON ndb.samplestoragesolutions;\n
-- DROP TRIGGER IF EXISTS tr_samplestoragesolutions_modifydate ON ndb.samplestoragesolutions;\n
CREATE TRIGGER tr_samplestoragesolutions_createdate BEFORE INSERT ON ndb.samplestoragesolutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();\n
CREATE TRIGGER tr_samplestoragesolutions_modifydate BEFORE INSERT ON ndb.samplestoragesolutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_samplestoragesolutions_modifydate BEFORE UPDATE ON ndb.samplestoragesolutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n