-- ndb.projectkeywords Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.projectkeywords

CREATE TABLE IF NOT EXISTS ndb.projectkeywords (

    projectid integer NULL,
    keywordid integer NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.projectkeywords IS '';
COMMENT ON COLUMN ndb.projectkeywords.projectid IS '';
COMMENT ON COLUMN ndb.projectkeywords.keywordid IS '';
COMMENT ON COLUMN ndb.projectkeywords.recdatecreated IS '';
COMMENT ON COLUMN ndb.projectkeywords.recdatemodified IS '';

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.projectkeywords ADD CONSTRAINT projectkeywords_projectid_fkey FOREIGN KEY (projectid) REFERENCES ndb.projects(projectid);
ALTER TABLE ndb.projectkeywords ADD CONSTRAINT projectkeywords_keywordid_fkey FOREIGN KEY (keywordid) REFERENCES ndb.keywords(keywordid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_projectkeywords_createdate ON ndb.projectkeywords;\n
-- DROP TRIGGER IF EXISTS tr_projectkeywords_modifydate ON ndb.projectkeywords;\n
-- DROP TRIGGER IF EXISTS tr_projectkeywords_modifydate ON ndb.projectkeywords;\n
CREATE TRIGGER tr_projectkeywords_createdate AFTER INSERT ON ndb.projectkeywords FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();\n
CREATE TRIGGER tr_projectkeywords_modifydate AFTER INSERT ON ndb.projectkeywords FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_projectkeywords_modifydate AFTER UPDATE ON ndb.projectkeywords FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n