-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.entitygeology

CREATE TABLE IF NOT EXISTS ndb.entitygeology (

    entityid integer NULL,
    speleothemgeologyid integer NULL,
    notes text NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.entitygeology IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.entitygeology ADD CONSTRAINT entitygeology_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid) ON DELETE CASCADE;