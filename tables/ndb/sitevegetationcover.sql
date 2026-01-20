-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.sitevegetationcover

CREATE TABLE IF NOT EXISTS ndb.sitevegetationcover (

    siteid integer NULL,
    vegetationcovertypeid integer NULL,
    vegetationcoverpercent integer NULL,
    vegetationcovernotes text NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.sitevegetationcover IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.sitevegetationcover ADD CONSTRAINT sitevegetationcover_vegetationcovertypeid_fkey FOREIGN KEY (vegetationcovertypeid) REFERENCES ndb.vegetationcovertypes(vegetationcovertypeid) ON DELETE CASCADE;
ALTER TABLE ndb.sitevegetationcover ADD CONSTRAINT sitevegetationcover_siteid_fkey FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON DELETE CASCADE;