-- contactreferences definition

-- Drop table

-- DROP TABLE IF EXISTS contactreferences.contactreferences

CREATE TABLE contactreferences.contactreferences (
    contactid integer NULL,
    exdatabaseid integer NULL,
    identifier text NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.contactreferences ADD CONSTRAINT contactreferences_exdatabaseid_fkey FOREIGN KEY (exdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid);
ALTER TABLE ndb.contactreferences ADD CONSTRAINT contactreferences_contactid_fkey FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);