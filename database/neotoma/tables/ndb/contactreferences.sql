-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.contactreferences

CREATE TABLE IF NOT EXISTS ndb.contactreferences (

    contactid integer NULL,
    exdatabaseid integer NULL,
    identifier text NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.contactreferences IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.contactreferences ADD CONSTRAINT contactreferences_exdatabaseid_fkey FOREIGN KEY (exdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid);
ALTER TABLE ndb.contactreferences ADD CONSTRAINT contactreferences_contactid_fkey FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);