-- entitylandusecover definition

-- Drop table

-- DROP TABLE IF EXISTS entitylandusecover.entitylandusecover

CREATE TABLE entitylandusecover.entitylandusecover (
    entityid integer NULL,
    landusecovertypeid integer NULL,
    landusecoverpercent integer NULL,
    landusecovernotes text NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.entitylandusecover ADD CONSTRAINT entitylandusecover_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid) ON DELETE CASCADE;
ALTER TABLE ndb.entitylandusecover ADD CONSTRAINT entitylandusecover_landusecovertypeid_fkey FOREIGN KEY (landusecovertypeid) REFERENCES ndb.vegetationcovertypes(vegetationcovertypeid) ON DELETE CASCADE;