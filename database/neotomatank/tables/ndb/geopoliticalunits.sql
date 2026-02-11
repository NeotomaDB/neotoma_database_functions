-- ndb.geopoliticalunits Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.geopoliticalunits

CREATE TABLE IF NOT EXISTS ndb.geopoliticalunits (

    geopoliticalid integer DEFAULT nextval('ndb.seq_geopoliticalunits_geopoliticalid'::regclass) NOT NULL,
    geopoliticalname character varying(255) NOT NULL,
    geopoliticalunit character varying(255) NULL,
    rank integer NOT NULL,
    highergeopoliticalid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.geopoliticalunits IS "Lookup table of GeoPoliticalUnits. Table is referenced by the SiteGeoPolitical table. These are countries and various subdivisions. Countries and subdivisions were acquired from the U.S. Central Intelligence Agency World Factbook8 and the ISO 3166-1 and ISO 3166-2 databases9.
Each GeoPolitical Unit has a rank. GeoPolitical Units with Rank 1 are generally countries. There are a few exceptions, including Antarctica and island territories, such as Greenland, which although a Danish territory, is geographically separate and distinct. Rank 2 units are generally secondary political divisions with various designations: e.g. states in the United States, provinces in Canada, and regions in France. For some countries, the secondary divisions are not political but rather distinct geographic entities, such as islands. The secondary divisions of some island nations include either groups of islands or sections of more highly populated islands; however, the actual island on which a site is located is more important information. Some countries also have Rank 3 units, e.g. counties in the United States and metropolitan departments in France. In addition to purely political units, various other administrative regions and geographic entities can be contained in this table. Examples of administrative regions are National Parks and Forests. It might be quite useful, for example, to have a record of all the sites in Yellowstone National Park. These additional units are Rank 4, and they can be added to the database as warranted.";

--- Table indices
CREATE UNIQUE INDEX geopoliticalunits_pkey ON ndb.geopoliticalunits USING btree (geopoliticalid);
CREATE INDEX ix_geopoliticalname_geopoliticalunits ON ndb.geopoliticalunits USING btree (geopoliticalname) WITH (fillfactor='10');
CREATE INDEX ix_rank_geopoliticalunits ON ndb.geopoliticalunits USING btree (rank) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.geopoliticalunits DROP CONSTRAINT IF EXISTS geopoliticalunits_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.geopoliticalunits ADD CONSTRAINT geopoliticalunits_pkey PRIMARY KEY (geopoliticalid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.geopoliticalunits;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.geopoliticalunits;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.geopoliticalunits FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.geopoliticalunits FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();