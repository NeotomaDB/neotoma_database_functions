-- ndb.externalcontacts Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.externalcontacts

CREATE TABLE IF NOT EXISTS ndb.externalcontacts (

    contactid integer NULL,
    identifier text NULL,
    extdatabaseid integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.externalcontacts IS "";

--- Table indices
CREATE UNIQUE INDEX externalcontacts_contactid_identifier_extdatabaseid_key ON ndb.externalcontacts USING btree (contactid, identifier, extdatabaseid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.externalcontacts DROP CONSTRAINT IF EXISTS externalcontacts_contactid_identifier_extdatabaseid_key;

--- Non-foreign key constraints
ALTER TABLE ndb.externalcontacts ADD CONSTRAINT externalcontacts_contactid_identifier_extdatabaseid_key UNIQUE (contactid, identifier, extdatabaseid);

--- Foreign Key Restraints
ALTER TABLE ndb.externalcontacts ADD CONSTRAINT externalcontacts_contactid_fkey FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);
ALTER TABLE ndb.externalcontacts ADD CONSTRAINT externalcontacts_extdatabaseid_fkey FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid);

--- Triggers