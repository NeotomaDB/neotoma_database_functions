-- externalspeleothemdata definition

-- Drop table

-- DROP TABLE IF EXISTS externalspeleothemdata.externalspeleothemdata

CREATE TABLE externalspeleothemdata.externalspeleothemdata (
    entityid integer NULL,
    externalid text NULL,
    extdatabaseid integer NULL,
    externaldescription text NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.externalspeleothemdata ADD CONSTRAINT externalspeleothemdata_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid) ON DELETE CASCADE;
ALTER TABLE ndb.externalspeleothemdata ADD CONSTRAINT externalspeleothemdata_extdatabaseid_fkey FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid);