-- ndb.projectparticipants Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.projectparticipants

CREATE TABLE IF NOT EXISTS ndb.projectparticipants (

    projectid integer NULL,
    contactid integer NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.projectparticipants IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.projectparticipants ADD CONSTRAINT projectparticipants_projectid_fkey FOREIGN KEY (projectid) REFERENCES ndb.projects(projectid);
ALTER TABLE ndb.projectparticipants ADD CONSTRAINT projectparticipants_contactid_fkey FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_projectparticipants_createdate ON ndb.projectparticipants;
-- DROP TRIGGER IF EXISTS tr_projectparticipants_modifydate ON ndb.projectparticipants;
-- DROP TRIGGER IF EXISTS tr_projectparticipants_modifydate ON ndb.projectparticipants;
CREATE TRIGGER tr_projectparticipants_createdate AFTER INSERT ON ndb.projectparticipants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();
CREATE TRIGGER tr_projectparticipants_modifydate AFTER INSERT ON ndb.projectparticipants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_projectparticipants_modifydate AFTER UPDATE ON ndb.projectparticipants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();