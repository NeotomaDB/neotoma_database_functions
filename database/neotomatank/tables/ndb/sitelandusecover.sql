-- ndb.sitelandusecover Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.sitelandusecover

CREATE TABLE IF NOT EXISTS ndb.sitelandusecover (

    siteid integer NULL,
    landusecovertypeid integer NULL,
    landusecoverpercent integer NULL,
    landusecovernotes text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.sitelandusecover IS '';
COMMENT ON COLUMN ndb.sitelandusecover.siteid IS '';
COMMENT ON COLUMN ndb.sitelandusecover.landusecovertypeid IS '';
COMMENT ON COLUMN ndb.sitelandusecover.landusecoverpercent IS '';
COMMENT ON COLUMN ndb.sitelandusecover.landusecovernotes IS '';

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.sitelandusecover ADD CONSTRAINT sitelandusecover_siteid_fkey FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON DELETE CASCADE;
ALTER TABLE ndb.sitelandusecover ADD CONSTRAINT sitelandusecover_landusecovertypeid_fkey FOREIGN KEY (landusecovertypeid) REFERENCES ndb.vegetationcovertypes(vegetationcovertypeid) ON DELETE CASCADE;

--- Triggers