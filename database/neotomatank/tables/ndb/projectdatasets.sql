-- ndb.projectdatasets Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.projectdatasets

CREATE TABLE IF NOT EXISTS ndb.projectdatasets (

    projectid integer NULL,
    datasetid integer NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.projectdatasets IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.projectdatasets ADD CONSTRAINT projectdatasets_projectid_fkey FOREIGN KEY (projectid) REFERENCES ndb.projects(projectid);
ALTER TABLE ndb.projectdatasets ADD CONSTRAINT projectdatasets_datasetid_fkey FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_projectdatasets_createdate ON ndb.projectdatasets;
-- DROP TRIGGER IF EXISTS tr_projectdatasets_modifydate ON ndb.projectdatasets;
-- DROP TRIGGER IF EXISTS tr_projectdatasets_modifydate ON ndb.projectdatasets;
CREATE TRIGGER tr_projectdatasets_createdate BEFORE INSERT ON ndb.projectdatasets FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();
CREATE TRIGGER tr_projectdatasets_modifydate BEFORE INSERT ON ndb.projectdatasets FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_projectdatasets_modifydate BEFORE UPDATE ON ndb.projectdatasets FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();