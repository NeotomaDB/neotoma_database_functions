-- ndb.sites Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.sites

CREATE TABLE IF NOT EXISTS ndb.sites (

    siteid integer DEFAULT nextval('ndb.seq_sites_siteid'::regclass) NOT NULL,
    sitename character varying(128) NULL,
    longitudeeast double precision NULL,
    latitudenorth double precision NULL,
    longitudewest double precision NULL,
    latitudesouth double precision NULL,
    altitude double precision NULL,
    area double precision NULL,
    sitedescription text NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    geog geography NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.sites IS "The Sites table stores information about sites or localities, including name, geographic coordinates, and description. Sites generally have an areal extent and can be circumscribed by a latitude-longitude box. However, site data ingested from legacy databases have included only point locations. The lat-long box can be used either to circumscribe the aerial extent of a site or to provide purposeful imprecision to the site location. Site location may be imprecise because the original description was vague, e.g. «a gravel bar 5 miles east of town», or because the investigators, land owner, or land management agency may not want the exact location made public, perhaps to prevent looting and vandalism. In the first case, the lat-long box can be made sufficiently large to encompass the true location and in the second case to prevent exact location.";

--- Table indices
CREATE UNIQUE INDEX sites_pkey ON ndb.sites USING btree (siteid);
CREATE INDEX ix_siteid_sites ON ndb.sites USING btree (siteid) WITH (fillfactor='10');
CREATE INDEX sitegeog_gix ON ndb.sites USING gist (geog);
CREATE INDEX sitenames_idx ON ndb.sites USING gin (sitename gin_trgm_ops)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.sites DROP CONSTRAINT IF EXISTS sites_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.sites ADD CONSTRAINT sites_pkey PRIMARY KEY (siteid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.sites;
-- DROP TRIGGER IF EXISTS updatelocations ON ndb.sites;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.sites;
-- DROP TRIGGER IF EXISTS updatelocations ON ndb.sites;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.sites FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER updatelocations AFTER INSERT ON ndb.sites FOR EACH ROW EXECUTE FUNCTION ti.site_bounding();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.sites FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER updatelocations AFTER UPDATE ON ndb.sites FOR EACH ROW EXECUTE FUNCTION ti.site_bounding();