-- ndb.projects Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.projects

CREATE TABLE IF NOT EXISTS ndb.projects (

    projectid integer DEFAULT nextval('ndb.projects_projectid_seq'::regclass) NOT NULL,
    projectname text NULL,
    projectdescription text NULL,
    projectstartdate timestamp without time zone NULL,
    projectenddate timestamp without time zone NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.projects IS "";

--- Table indices
CREATE UNIQUE INDEX projects_pkey ON ndb.projects USING btree (projectid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.projects DROP CONSTRAINT IF EXISTS projects_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.projects ADD CONSTRAINT projects_pkey PRIMARY KEY (projectid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_projects_createdate ON ndb.projects;
-- DROP TRIGGER IF EXISTS tr_projects_modifydate ON ndb.projects;
-- DROP TRIGGER IF EXISTS tr_projects_modifydate ON ndb.projects;
CREATE TRIGGER tr_projects_createdate AFTER INSERT ON ndb.projects FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();
CREATE TRIGGER tr_projects_modifydate AFTER INSERT ON ndb.projects FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_projects_modifydate AFTER UPDATE ON ndb.projects FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();