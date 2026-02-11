-- ndb.entityrelationship Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.entityrelationship

CREATE TABLE IF NOT EXISTS ndb.entityrelationship (

    entityid integer NULL,
    entitystatusid integer NULL,
    referenceentityid integer NULL,
    notes text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.entityrelationship IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.entityrelationship ADD CONSTRAINT entityrelationship_entitystatusid_fkey FOREIGN KEY (entitystatusid) REFERENCES ndb.speleothementitystatuses(entitystatusid);
ALTER TABLE ndb.entityrelationship ADD CONSTRAINT entityrelationship_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid);
ALTER TABLE ndb.entityrelationship ADD CONSTRAINT entityrelationship_referenceentityid_fkey FOREIGN KEY (referenceentityid) REFERENCES ndb.speleothems(entityid);

--- Triggers