-- ndb.entityvegetationcover Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.entityvegetationcover

CREATE TABLE IF NOT EXISTS ndb.entityvegetationcover (

    entityid integer NULL,
    vegetationcovertypeid integer NULL,
    vegetationcoverpercent integer NULL,
    vegetationcovernotes text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.entityvegetationcover IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.entityvegetationcover ADD CONSTRAINT entityvegetationcover_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid) ON DELETE CASCADE;
ALTER TABLE ndb.entityvegetationcover ADD CONSTRAINT entityvegetationcover_vegetationcovertypeid_fkey FOREIGN KEY (vegetationcovertypeid) REFERENCES ndb.vegetationcovertypes(vegetationcovertypeid) ON DELETE CASCADE;

--- Triggers