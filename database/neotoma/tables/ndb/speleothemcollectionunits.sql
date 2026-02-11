-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.speleothemcollectionunits

CREATE TABLE IF NOT EXISTS ndb.speleothemcollectionunits (

    entityid integer NULL,
    collectionunitid integer NULL,
    persistid text NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.speleothemcollectionunits IS "";

--- Table indices
CREATE UNIQUE INDEX unique_collectionunitid ON ndb.speleothemcollectionunits USING btree (collectionunitid)

--- Remove existing constraints if needed
ALTER TABLE ndb.speleothemcollectionunits DROP CONSTRAINT IF EXISTS unique_collectionunitid;

--- Non-foreign key constraints
ALTER TABLE ndb.speleothemcollectionunits ADD CONSTRAINT unique_collectionunitid UNIQUE (collectionunitid);

--- Foreign Key Restraints
ALTER TABLE ndb.speleothemcollectionunits ADD CONSTRAINT speleothemcollectionunits_collectionunitid_fkey FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON DELETE CASCADE;
ALTER TABLE ndb.speleothemcollectionunits ADD CONSTRAINT speleothemcollectionunits_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid) ON DELETE CASCADE;