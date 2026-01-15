-- externalcontacts definition

-- Drop table

-- DROP TABLE IF EXISTS externalcontacts.externalcontacts

CREATE TABLE externalcontacts.externalcontacts (
    contactid integer NULL,
    identifier text NULL,
    extdatabaseid integer NULL,
    CONSTRAINT externalcontacts_contactid_identifier_extdatabaseid_key UNIQUE (contactid, identifier, extdatabaseid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.externalcontacts ADD CONSTRAINT externalcontacts_contactid_fkey FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);
ALTER TABLE ndb.externalcontacts ADD CONSTRAINT externalcontacts_extdatabaseid_fkey FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid);