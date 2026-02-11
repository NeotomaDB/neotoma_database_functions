-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.entitylandusecover

CREATE TABLE IF NOT EXISTS ndb.entitylandusecover (

    entityid integer NULL,
    landusecovertypeid integer NULL,
    landusecoverpercent integer NULL,
    landusecovernotes text NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.entitylandusecover IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.entitylandusecover ADD CONSTRAINT entitylandusecover_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid) ON DELETE CASCADE;
ALTER TABLE ndb.entitylandusecover ADD CONSTRAINT entitylandusecover_landusecovertypeid_fkey FOREIGN KEY (landusecovertypeid) REFERENCES ndb.vegetationcovertypes(vegetationcovertypeid) ON DELETE CASCADE;