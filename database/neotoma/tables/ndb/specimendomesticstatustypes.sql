-- ndb.specimendomesticstatustypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.specimendomesticstatustypes

CREATE TABLE IF NOT EXISTS ndb.specimendomesticstatustypes (

    domesticstatusid integer DEFAULT nextval('ndb.seq_specimendomesticstatustypes_domesticstatusid'::regclass) NOT NULL,
    domesticstatus character varying(24) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.specimendomesticstatustypes IS '';
COMMENT ON COLUMN ndb.specimendomesticstatustypes.domesticstatusid IS '';
COMMENT ON COLUMN ndb.specimendomesticstatustypes.domesticstatus IS '';
COMMENT ON COLUMN ndb.specimendomesticstatustypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.specimendomesticstatustypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX specimendomesticstatustypes_pkey ON ndb.specimendomesticstatustypes USING btree (domesticstatusid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.specimendomesticstatustypes DROP CONSTRAINT IF EXISTS specimendomesticstatustypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.specimendomesticstatustypes ADD CONSTRAINT specimendomesticstatustypes_pkey PRIMARY KEY (domesticstatusid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.specimendomesticstatustypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.specimendomesticstatustypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.specimendomesticstatustypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.specimendomesticstatustypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n