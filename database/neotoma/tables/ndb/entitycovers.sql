-- ndb.entitycovers Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.entitycovers

CREATE TABLE IF NOT EXISTS ndb.entitycovers (

    entityid integer NULL,
    entitycoverid integer NULL,
    entitycoverthickness real NULL,
    entitycoverunits integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.entitycovers IS '';
COMMENT ON COLUMN ndb.entitycovers.entityid IS '';
COMMENT ON COLUMN ndb.entitycovers.entitycoverid IS '';
COMMENT ON COLUMN ndb.entitycovers.entitycoverthickness IS '';
COMMENT ON COLUMN ndb.entitycovers.entitycoverunits IS '';

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.entitycovers ADD CONSTRAINT entitycovers_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid) ON DELETE CASCADE;
ALTER TABLE ndb.entitycovers ADD CONSTRAINT entitycovers_entitycoverid_fkey FOREIGN KEY (entitycoverid) REFERENCES ndb.entitycovertypes(entitycoverid);
ALTER TABLE ndb.entitycovers ADD CONSTRAINT entitycovers_entitycoverunits_fkey FOREIGN KEY (entitycoverunits) REFERENCES ndb.variableunits(variableunitsid);

--- Triggers