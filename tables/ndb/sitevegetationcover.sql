-- sitevegetationcover definition

-- Drop table

-- DROP TABLE IF EXISTS sitevegetationcover.sitevegetationcover

CREATE TABLE sitevegetationcover.sitevegetationcover (
    siteid integer NULL,
    vegetationcovertypeid integer NULL,
    vegetationcoverpercent integer NULL,
    vegetationcovernotes text NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.sitevegetationcover ADD CONSTRAINT sitevegetationcover_vegetationcovertypeid_fkey FOREIGN KEY (vegetationcovertypeid) REFERENCES ndb.vegetationcovertypes(vegetationcovertypeid) ON DELETE CASCADE;
ALTER TABLE ndb.sitevegetationcover ADD CONSTRAINT sitevegetationcover_siteid_fkey FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON DELETE CASCADE;