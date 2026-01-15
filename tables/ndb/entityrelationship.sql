-- entityrelationship definition

-- Drop table

-- DROP TABLE IF EXISTS entityrelationship.entityrelationship

CREATE TABLE entityrelationship.entityrelationship (
    entityid integer NULL,
    entitystatusid integer NULL,
    referenceentityid integer NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.entityrelationship ADD CONSTRAINT entityrelationship_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid);
ALTER TABLE ndb.entityrelationship ADD CONSTRAINT entityrelationship_entitystatusid_fkey FOREIGN KEY (entitystatusid) REFERENCES ndb.speleothementitystatuses(entitystatusid);
ALTER TABLE ndb.entityrelationship ADD CONSTRAINT entityrelationship_referenceentityid_fkey FOREIGN KEY (referenceentityid) REFERENCES ndb.speleothems(entityid);