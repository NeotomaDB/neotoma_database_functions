-- entityvegetationcover definition

-- Drop table

-- DROP TABLE IF EXISTS entityvegetationcover.entityvegetationcover

CREATE TABLE entityvegetationcover.entityvegetationcover (
    entityid integer NULL,
    vegetationcovertypeid integer NULL,
    vegetationcoverpercent integer NULL,
    vegetationcovernotes text NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.entityvegetationcover ADD CONSTRAINT entityvegetationcover_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid) ON DELETE CASCADE;
ALTER TABLE ndb.entityvegetationcover ADD CONSTRAINT entityvegetationcover_vegetationcovertypeid_fkey FOREIGN KEY (vegetationcovertypeid) REFERENCES ndb.vegetationcovertypes(vegetationcovertypeid) ON DELETE CASCADE;