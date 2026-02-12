-- ndb.fundinginstitutions Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.fundinginstitutions

CREATE TABLE IF NOT EXISTS ndb.fundinginstitutions (

    institutionid text NULL,
    grantid integer NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.fundinginstitutions IS '';
COMMENT ON COLUMN ndb.fundinginstitutions.institutionid IS '';
COMMENT ON COLUMN ndb.fundinginstitutions.grantid IS '';
COMMENT ON COLUMN ndb.fundinginstitutions.recdatecreated IS '';
COMMENT ON COLUMN ndb.fundinginstitutions.recdatemodified IS '';

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.fundinginstitutions ADD CONSTRAINT fundinginstitutions_institutionid_fkey FOREIGN KEY (institutionid) REFERENCES ndb.institutions(institutionid);
ALTER TABLE ndb.fundinginstitutions ADD CONSTRAINT fundinginstitutions_grantid_fkey FOREIGN KEY (grantid) REFERENCES ndb.grants(grantid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_agency_createdate ON ndb.fundinginstitutions;\n
-- DROP TRIGGER IF EXISTS tr_agency_modifydate ON ndb.fundinginstitutions;\n
-- DROP TRIGGER IF EXISTS tr_agency_modifydate ON ndb.fundinginstitutions;\n
CREATE TRIGGER tr_agency_createdate BEFORE INSERT ON ndb.fundinginstitutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();\n
CREATE TRIGGER tr_agency_modifydate BEFORE INSERT ON ndb.fundinginstitutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_agency_modifydate BEFORE UPDATE ON ndb.fundinginstitutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n