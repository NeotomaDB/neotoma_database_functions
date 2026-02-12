-- ndb.sitegeopolitical Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.sitegeopolitical

CREATE TABLE IF NOT EXISTS ndb.sitegeopolitical (

    sitegeopoliticalid integer DEFAULT nextval('ndb.seq_sitegeopolitical_sitegeopoliticalid'::regclass) NOT NULL,
    siteid integer NOT NULL,
    geopoliticalid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    objectid integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.sitegeopolitical IS 'This table lists the GeoPolitical units in which sites occur.';
COMMENT ON COLUMN ndb.sitegeopolitical.sitegeopoliticalid IS 'An arbitrary Site GeoPolitical identification number.';
COMMENT ON COLUMN ndb.sitegeopolitical.siteid IS 'Site identification number. Field links to the Sites table.';
COMMENT ON COLUMN ndb.sitegeopolitical.geopoliticalid IS 'GeoPolitical identification number. Field links to the GeoPoliticalUnits lookup table.';
COMMENT ON COLUMN ndb.sitegeopolitical.recdatecreated IS '';
COMMENT ON COLUMN ndb.sitegeopolitical.recdatemodified IS '';
COMMENT ON COLUMN ndb.sitegeopolitical.objectid IS '';

--- Table indices
CREATE UNIQUE INDEX sitegeopolitical_pkey ON ndb.sitegeopolitical USING btree (sitegeopoliticalid);
CREATE INDEX ix_geopoliticalid_sitegeopolitical ON ndb.sitegeopolitical USING btree (geopoliticalid) WITH (fillfactor='10');
CREATE INDEX ix_siteid_sitegeopolitical ON ndb.sitegeopolitical USING btree (siteid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.sitegeopolitical DROP CONSTRAINT IF EXISTS sitegeopolitical_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.sitegeopolitical ADD CONSTRAINT sitegeopolitical_pkey PRIMARY KEY (sitegeopoliticalid);

--- Foreign Key Restraints
ALTER TABLE ndb.sitegeopolitical ADD CONSTRAINT fk_sitegeopolitical_sites FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.sitegeopolitical ADD CONSTRAINT fk_sitegeopolitical_geopoliticalunits FOREIGN KEY (geopoliticalid) REFERENCES ndb.geopoliticalunits(geopoliticalid);
ALTER TABLE ndb.sitegeopolitical ADD CONSTRAINT fk_objectid FOREIGN KEY (objectid) REFERENCES ap.gadm(objectid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.sitegeopolitical;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.sitegeopolitical;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.sitegeopolitical FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.sitegeopolitical FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n