-- entitygeology definition

-- Drop table

-- DROP TABLE IF EXISTS entitygeology.entitygeology

CREATE TABLE entitygeology.entitygeology (
    entityid integer NULL,
    speleothemgeologyid integer NULL,
    notes text NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.entitygeology ADD CONSTRAINT entitygeology_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid) ON DELETE CASCADE;