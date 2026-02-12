-- ndb.analysisunits Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.analysisunits

CREATE TABLE IF NOT EXISTS ndb.analysisunits (

    analysisunitid integer DEFAULT nextval('ndb.seq_analysisunits_analysisunitid'::regclass) NOT NULL,
    collectionunitid integer NOT NULL,
    analysisunitname character varying(80) NULL,
    depth double precision NULL,
    thickness double precision NULL,
    faciesid integer NULL,
    mixed boolean NOT NULL,
    igsn character varying(40) NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.analysisunits IS 'This table stores the data for Analysis Units.';
COMMENT ON COLUMN ndb.analysisunits.analysisunitid IS 'An arbitrary Analysis Unit identification number.';
COMMENT ON COLUMN ndb.analysisunits.collectionunitid IS 'Collection Unit ID number. Field links to CollectionUnits table. Every Analysis Unit belongs to a Collection Unit.';
COMMENT ON COLUMN ndb.analysisunits.analysisunitname IS 'Optional name for an Analysis Unit. Analysis Units are usually designated with either a depth or a name, sometimes both.';
COMMENT ON COLUMN ndb.analysisunits.depth IS 'Optional depth of the Analysis Unit in cm. Depths are typically designated for Analysis Units from cores and for Analysis Units excavated in arbitrary (e.g. 10 cm) levels. Depths are normally the midpoints of arbitrary levels. For example, for a level excavated from 10 to 20 cm or for a core section from 10 to 15 cm, the depth is 15. Designating depths as midpoints and thicknesses facilitates calculation of ages from age models that utilize single midpoint depths for Analysis Units rather than top and bottom depths. Of course, top and bottom depths can be calculated from midpoint depths and thicknesses. For many microfossil core samples, only the midpoint depths are known or published; the diameter or width of the sampling device is often not given.';
COMMENT ON COLUMN ndb.analysisunits.thickness IS 'Optional thickness of the Analysis Unit in cm. For many microfossil core samples, the depths are treated as points, and the thicknesses are not given in the publications, although 0.5 to 1.0 cm would be typical.';
COMMENT ON COLUMN ndb.analysisunits.faciesid IS 'Sedimentary facies of the Analysis Unit. Field links to the FaciesTypes table.';
COMMENT ON COLUMN ndb.analysisunits.mixed IS 'Indicates whether specimens in the Analysis Unit are of mixed ages, for example Pleistocene fossils occurring with late Holocene fossils. Although Analysis Units may be mixed, samples from the Analysis Unit may not be, for example individually radiocarbon dated specimens.';
COMMENT ON COLUMN ndb.analysisunits.igsn IS 'International Geo Sample Number. The IGSN is a unique identifier for a Geoscience sample. They are assigned by the SESAR, the System for Earth Sample Registration (www.geosamples.org), which is a registry that provides and administers the unique identifiers. IGSN’s may be assigned to all types of geoscience samples, including cores, rocks, minerals, and even fluids. Their purpose is to facilitate sharing and correlation of samples and sample-based data. For data in Neotoma, their primary value would be for correlation various samples from the same Analysis Units, for example pollen, charcoal, diatoms, and geochemical analyses. Conceivably, the AnalysisUnitID could be used for this purpose; however, IGSN’s could be assigned by projects before their data are submitted to the database. Moreover, AnalysisUnitID’s are intended to be internal to the database. Although IGSN’s could be assigned to Neotoma Collection Units and Samples, their primary value lies in their assignment to Analysis Units. IGSN’s are not yet assigned to Neotoma Analysis Units; however, that may change after consultation with SESAR.';
COMMENT ON COLUMN ndb.analysisunits.notes IS 'Free form notes or comments about the Analysis Unit.';
COMMENT ON COLUMN ndb.analysisunits.recdatecreated IS '';
COMMENT ON COLUMN ndb.analysisunits.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX analysisunits_pkey ON ndb.analysisunits USING btree (analysisunitid);
CREATE INDEX analysisunits_collunit_idx ON ndb.analysisunits USING btree (collectionunitid);
CREATE INDEX analysisunits_facies_idx ON ndb.analysisunits USING btree (faciesid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.analysisunits DROP CONSTRAINT IF EXISTS analysisunits_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.analysisunits ADD CONSTRAINT analysisunits_pkey PRIMARY KEY (analysisunitid);

--- Foreign Key Restraints
ALTER TABLE ndb.analysisunits ADD CONSTRAINT fk_analysisunits_faciestypes FOREIGN KEY (faciesid) REFERENCES ndb.faciestypes(faciesid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.analysisunits ADD CONSTRAINT fk_analysisunits_collectionunits FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.analysisunits;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.analysisunits;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.analysisunits FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.analysisunits FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n