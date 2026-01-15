-- entitycovers definition

-- Drop table

-- DROP TABLE IF EXISTS entitycovers.entitycovers

CREATE TABLE entitycovers.entitycovers (
    entityid integer NULL,
    entitycoverid integer NULL,
    entitycoverthickness real NULL,
    entitycoverunits integer NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.entitycovers ADD CONSTRAINT entitycovers_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid) ON DELETE CASCADE;
ALTER TABLE ndb.entitycovers ADD CONSTRAINT entitycovers_entitycoverid_fkey FOREIGN KEY (entitycoverid) REFERENCES ndb.entitycovertypes(entitycoverid);
ALTER TABLE ndb.entitycovers ADD CONSTRAINT entitycovers_entitycoverunits_fkey FOREIGN KEY (entitycoverunits) REFERENCES ndb.variableunits(variableunitsid);