-- speleothemcollectionunits definition

-- Drop table

-- DROP TABLE IF EXISTS speleothemcollectionunits.speleothemcollectionunits

CREATE TABLE speleothemcollectionunits.speleothemcollectionunits (
    entityid integer NULL,
    collectionunitid integer NULL,
    persistid text NULL,
    CONSTRAINT unique_collectionunitid UNIQUE (collectionunitid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.speleothemcollectionunits ADD CONSTRAINT speleothemcollectionunits_collectionunitid_fkey FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON DELETE CASCADE;
ALTER TABLE ndb.speleothemcollectionunits ADD CONSTRAINT speleothemcollectionunits_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid) ON DELETE CASCADE;