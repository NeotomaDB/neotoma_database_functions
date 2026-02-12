-- ndb.externalgrants Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.externalgrants

CREATE TABLE IF NOT EXISTS ndb.externalgrants (

    grantid integer NULL,
    identifier text NULL,
    extdatabaseid integer NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.externalgrants IS '';
COMMENT ON COLUMN ndb.externalgrants.grantid IS '';
COMMENT ON COLUMN ndb.externalgrants.identifier IS '';
COMMENT ON COLUMN ndb.externalgrants.extdatabaseid IS '';
COMMENT ON COLUMN ndb.externalgrants.recdatecreated IS '';
COMMENT ON COLUMN ndb.externalgrants.recdatemodified IS '';

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.externalgrants ADD CONSTRAINT externalgrants_extdatabaseid_fkey FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_externalgrants_createdate ON ndb.externalgrants;\n
-- DROP TRIGGER IF EXISTS tr_externalgrants_modifydate ON ndb.externalgrants;\n
-- DROP TRIGGER IF EXISTS tr_externalgrants_modifydate ON ndb.externalgrants;\n
CREATE TRIGGER tr_externalgrants_createdate AFTER INSERT ON ndb.externalgrants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();\n
CREATE TRIGGER tr_externalgrants_modifydate AFTER INSERT ON ndb.externalgrants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_externalgrants_modifydate AFTER UPDATE ON ndb.externalgrants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n