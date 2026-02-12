-- ndb.projectgrants Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.projectgrants

CREATE TABLE IF NOT EXISTS ndb.projectgrants (

    projectid integer NULL,
    grantid integer NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.projectgrants IS '';
COMMENT ON COLUMN ndb.projectgrants.projectid IS '';
COMMENT ON COLUMN ndb.projectgrants.grantid IS '';
COMMENT ON COLUMN ndb.projectgrants.recdatecreated IS '';
COMMENT ON COLUMN ndb.projectgrants.recdatemodified IS '';

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.projectgrants ADD CONSTRAINT projectgrants_projectid_fkey FOREIGN KEY (projectid) REFERENCES ndb.projects(projectid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_projectgrants_createdate ON ndb.projectgrants;\n
-- DROP TRIGGER IF EXISTS tr_projectgrants_modifydate ON ndb.projectgrants;\n
-- DROP TRIGGER IF EXISTS tr_projectgrants_modifydate ON ndb.projectgrants;\n
CREATE TRIGGER tr_projectgrants_createdate AFTER INSERT ON ndb.projectgrants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();\n
CREATE TRIGGER tr_projectgrants_modifydate AFTER INSERT ON ndb.projectgrants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_projectgrants_modifydate AFTER UPDATE ON ndb.projectgrants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n