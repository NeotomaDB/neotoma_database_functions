-- ndb.externalinstitutions Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.externalinstitutions

CREATE TABLE IF NOT EXISTS ndb.externalinstitutions (

    institutionid text NOT NULL,
    identifier text NULL,
    extdatabaseid integer NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.externalinstitutions IS "";

--- Table indices
CREATE UNIQUE INDEX externalinstitutions_institutionid_identifier_extdatabaseid_key ON ndb.externalinstitutions USING btree (institutionid, identifier, extdatabaseid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.externalinstitutions DROP CONSTRAINT IF EXISTS externalinstitutions_institutionid_identifier_extdatabaseid_key;

--- Non-foreign key constraints
ALTER TABLE ndb.externalinstitutions ADD CONSTRAINT externalinstitutions_institutionid_identifier_extdatabaseid_key UNIQUE (institutionid, identifier, extdatabaseid);

--- Foreign Key Restraints
ALTER TABLE ndb.externalinstitutions ADD CONSTRAINT externalinstitutions_institutionid_fkey FOREIGN KEY (institutionid) REFERENCES ndb.institutions(institutionid);
ALTER TABLE ndb.externalinstitutions ADD CONSTRAINT externalinstitutions_extdatabaseid_fkey FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_externalinstitutions_createdate ON ndb.externalinstitutions;
-- DROP TRIGGER IF EXISTS tr_externalinstitutions_modifydate ON ndb.externalinstitutions;
-- DROP TRIGGER IF EXISTS tr_externalinstitutions_modifydate ON ndb.externalinstitutions;
CREATE TRIGGER tr_externalinstitutions_createdate BEFORE INSERT ON ndb.externalinstitutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();
CREATE TRIGGER tr_externalinstitutions_modifydate BEFORE INSERT ON ndb.externalinstitutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_externalinstitutions_modifydate BEFORE UPDATE ON ndb.externalinstitutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();