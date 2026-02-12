-- ndb.collectionunits Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.collectionunits

CREATE TABLE IF NOT EXISTS ndb.collectionunits (

    collectionunitid integer DEFAULT nextval('ndb.seq_collectionunits_collectionunitid'::regclass) NOT NULL,
    handle character varying(16) NOT NULL,
    siteid integer NOT NULL,
    colltypeid integer NULL,
    depenvtid integer NULL,
    collunitname character varying(255) NULL,
    colldate date NULL,
    colldevice character varying(255) NULL,
    gpslatitude double precision NULL,
    gpslongitude double precision NULL,
    gpsaltitude double precision NULL,
    gpserror double precision NULL,
    waterdepth double precision NULL,
    substrateid integer NULL,
    slopeaspect integer NULL,
    slopeangle integer NULL,
    location character varying(255) NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.collectionunits IS 'This table stores data for Collection Units.';
COMMENT ON COLUMN ndb.collectionunits.collectionunitid IS 'An arbitrary Collection Unit identification number.';
COMMENT ON COLUMN ndb.collectionunits.handle IS 'Code name for the Collection Unit. This code may be up to 10 characters, but an effort is made to keep these to 8 characters or less. Data are frequently distributed by Collection Unit, and the Handle is used for file names.';
COMMENT ON COLUMN ndb.collectionunits.siteid IS 'Site where CollectionUnit was located. Field links to Sites table.';
COMMENT ON COLUMN ndb.collectionunits.colltypeid IS 'Type of Collection Unit. Field links to the CollectionTypes table.';
COMMENT ON COLUMN ndb.collectionunits.depenvtid IS 'Depositional environment of the CollectionUnit. Normally, this key refers to the modern environment. For example, the site may be located on a colluvial slope, in which case the Depositional Environment may be Colluvium or Colluvial Fan. However, an excavation may extend into alluvial sediments, which represent a different depositional environment. These are accounted for by the Facies of the AnalysisUnit. Field links to the DepEnvtTypes table.';
COMMENT ON COLUMN ndb.collectionunits.collunitname IS 'Name of the Collection Unit. Examples: Core BPT82A, Structure 9, P4A Test 57. If faunal data are reported from a site or locality without explicit Collection Units, then data are assigned to a single Collection Unit with the name «Locality».';
COMMENT ON COLUMN ndb.collectionunits.colldate IS 'Date Collection Unit was collected.';
COMMENT ON COLUMN ndb.collectionunits.colldevice IS 'Device used for obtain Collection Unit. This field applies primarily to cores, for example «Wright square-rod piston corer (5 cm)».';
COMMENT ON COLUMN ndb.collectionunits.gpslatitude IS 'Precise latitude of the Collection Unit, typically taken with a GPS, although may be precisely measured from a map.';
COMMENT ON COLUMN ndb.collectionunits.gpslongitude IS 'Precise longitude of the Collection Unit, typically taken with a GPS, although may be precisely measured from a map.';
COMMENT ON COLUMN ndb.collectionunits.gpsaltitude IS 'Precise altitude of the Collection Unit, typically taken with a GPS or precisely obtained from a map.';
COMMENT ON COLUMN ndb.collectionunits.gpserror IS 'Error in the horizontal GPS coordinates, if known.';
COMMENT ON COLUMN ndb.collectionunits.waterdepth IS 'Depth of water at the Collection Unit location. This field applies mainly to Collection Units from lakes.';
COMMENT ON COLUMN ndb.collectionunits.substrateid IS 'Substrate or rock type on which the Collection Unit lies. Field links to the RockTypes table. This field is especially used for rodent middens.';
COMMENT ON COLUMN ndb.collectionunits.slopeaspect IS 'For Collection Units on slopes, the horizontal direction to which a slope faces measured in degrees clockwise from north. This field is especially used for rodent middens.';
COMMENT ON COLUMN ndb.collectionunits.slopeangle IS 'For Collection Units on slopes, the angle of slope from horizontal. field is especially used for rodent middens.';
COMMENT ON COLUMN ndb.collectionunits.location IS 'Short description of the location of the Collection Unit within the site.';
COMMENT ON COLUMN ndb.collectionunits.notes IS 'Free form notes or comments about the Collection Unit.';
COMMENT ON COLUMN ndb.collectionunits.recdatecreated IS '';
COMMENT ON COLUMN ndb.collectionunits.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX collectionunits_pkey ON ndb.collectionunits USING btree (collectionunitid);
CREATE INDEX ix_collectionunitid_collectionunits ON ndb.collectionunits USING btree (collectionunitid) WITH (fillfactor='10');
CREATE INDEX ix_depenvtid_collectionunits ON ndb.collectionunits USING btree (depenvtid) WITH (fillfactor='10');
CREATE INDEX ix_siteid_collectionunits ON ndb.collectionunits USING btree (siteid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.collectionunits DROP CONSTRAINT IF EXISTS collectionunits_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.collectionunits ADD CONSTRAINT collectionunits_pkey PRIMARY KEY (collectionunitid);

--- Foreign Key Restraints
ALTER TABLE ndb.collectionunits ADD CONSTRAINT fk_collectionunits_depenvttypes FOREIGN KEY (depenvtid) REFERENCES ndb.depenvttypes(depenvtid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.collectionunits ADD CONSTRAINT fk_collectionunits_collectiontypes FOREIGN KEY (colltypeid) REFERENCES ndb.collectiontypes(colltypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.collectionunits ADD CONSTRAINT fk_collectionunits_rocktypes FOREIGN KEY (substrateid) REFERENCES ndb.rocktypes(rocktypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.collectionunits ADD CONSTRAINT fk_collectionunits_sites FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.collectionunits;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.collectionunits;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.collectionunits FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.collectionunits FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n