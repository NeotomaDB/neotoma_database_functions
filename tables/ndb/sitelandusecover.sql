-- sitelandusecover definition

-- Drop table

-- DROP TABLE IF EXISTS sitelandusecover.sitelandusecover

CREATE TABLE sitelandusecover.sitelandusecover (
    siteid integer NULL,
    landusecovertypeid integer NULL,
    landusecoverpercent integer NULL,
    landusecovernotes text NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.sitelandusecover ADD CONSTRAINT sitelandusecover_landusecovertypeid_fkey FOREIGN KEY (landusecovertypeid) REFERENCES ndb.vegetationcovertypes(vegetationcovertypeid) ON DELETE CASCADE;
ALTER TABLE ndb.sitelandusecover ADD CONSTRAINT sitelandusecover_siteid_fkey FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON DELETE CASCADE;