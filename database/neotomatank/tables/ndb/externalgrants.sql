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
COMMENT ON TABLE ndb.externalgrants IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.externalgrants ADD CONSTRAINT externalgrants_extdatabaseid_fkey FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_externalgrants_createdate ON ndb.externalgrants;
-- DROP TRIGGER IF EXISTS tr_externalgrants_modifydate ON ndb.externalgrants;
-- DROP TRIGGER IF EXISTS tr_externalgrants_modifydate ON ndb.externalgrants;
CREATE TRIGGER tr_externalgrants_createdate AFTER INSERT ON ndb.externalgrants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();
CREATE TRIGGER tr_externalgrants_modifydate AFTER INSERT ON ndb.externalgrants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_externalgrants_modifydate AFTER UPDATE ON ndb.externalgrants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();