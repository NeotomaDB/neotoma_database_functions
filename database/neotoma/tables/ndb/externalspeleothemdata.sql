-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.externalspeleothemdata

CREATE TABLE IF NOT EXISTS ndb.externalspeleothemdata (

    entityid integer NULL,
    externalid text NULL,
    extdatabaseid integer NULL,
    externaldescription text NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.externalspeleothemdata IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.externalspeleothemdata ADD CONSTRAINT externalspeleothemdata_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid) ON DELETE CASCADE;
ALTER TABLE ndb.externalspeleothemdata ADD CONSTRAINT externalspeleothemdata_extdatabaseid_fkey FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid);