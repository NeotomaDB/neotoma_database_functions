-- ndb.geochronology Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.geochronology

CREATE TABLE IF NOT EXISTS ndb.geochronology (

    geochronid integer DEFAULT nextval('ndb.seq_geochronology_geochronid'::regclass) NOT NULL,
    sampleid integer NOT NULL,
    geochrontypeid integer NOT NULL,
    agetypeid integer NOT NULL,
    age double precision NULL,
    errorolder double precision NULL,
    erroryounger double precision NULL,
    infinite boolean NOT NULL,
    delta13c double precision NULL,
    labnumber character varying(40) NULL,
    materialdated character varying(255) NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.geochronology IS 'This table stores geochronologic data. Geochronologic measurements are from geochronologic samples, which are from Analysis Units, which may have a depth and thickness. Geochronologic measurements may be from the same or different Analysis Units as fossils. In the case of faunal excavations, geochronologic samples are typically from the same Analysis Units as the fossils, and there may be multiple geochronologic samples from a single Analysis Unit. In the case of cores used for microfossil analysis, geochronologic samples are often from separate Analysis Units; dated core sections are often thicker than microfossil Analysis Units.';
COMMENT ON COLUMN ndb.geochronology.geochronid IS 'An arbitrary Geochronologic identification number.';
COMMENT ON COLUMN ndb.geochronology.sampleid IS 'Sample identification number. Field links to Samples table.';
COMMENT ON COLUMN ndb.geochronology.geochrontypeid IS 'Identification number for the type of Geochronologic analysis, e.g. «Carbon-14», «Thermoluminescence». Field links to the GeochronTypes table.';
COMMENT ON COLUMN ndb.geochronology.agetypeid IS 'Identification number for the age units, e.g. «Radiocarbon years BP», «Calibrated radiocarbon years BP».';
COMMENT ON COLUMN ndb.geochronology.age IS 'Reported age value of the geochronologic measurement.';
COMMENT ON COLUMN ndb.geochronology.errorolder IS 'The older error limit of the age value. For a date reported with ±1 SD or σ, the ErrorOlder and ErrorYounger values are this value.';
COMMENT ON COLUMN ndb.geochronology.erroryounger IS 'The younger error limit of the age value.';
COMMENT ON COLUMN ndb.geochronology.infinite IS 'Is «True» for and infinite or “greater than” geochronologic measurement, otherwise is «False».';
COMMENT ON COLUMN ndb.geochronology.delta13c IS 'The measured or assumed δ13C value for radiocarbon dates, if provided. Radiocarbon dates are assumed to be normalized to δ13C, and if uncorrected and normalized ages are reported, the normalized age should be entered in the database.';
COMMENT ON COLUMN ndb.geochronology.labnumber IS 'Lab number for the geochronologic measurement.';
COMMENT ON COLUMN ndb.geochronology.materialdated IS 'Material analyzed for a geochronologic measurement.';
COMMENT ON COLUMN ndb.geochronology.notes IS 'Free form notes or comments about the geochronologic measurement.';
COMMENT ON COLUMN ndb.geochronology.recdatecreated IS '';
COMMENT ON COLUMN ndb.geochronology.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX geochronology_pkey ON ndb.geochronology USING btree (geochronid);
CREATE INDEX geoage_idx ON ndb.geochronology USING btree (age);
CREATE INDEX ix_sampleid_geochronology ON ndb.geochronology USING btree (sampleid) WITH (fillfactor='10');
CREATE INDEX geochronology_labnumber_idx ON ndb.geochronology USING btree (labnumber);
CREATE UNIQUE INDEX geochronology_unique ON ndb.geochronology USING btree (sampleid, labnumber)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.geochronology DROP CONSTRAINT IF EXISTS geochronology_pkey;
-- ALTER TABLE ndb.geochronology DROP CONSTRAINT IF EXISTS geochronology_unique;

--- Non-foreign key constraints
ALTER TABLE ndb.geochronology ADD CONSTRAINT geochronology_pkey PRIMARY KEY (geochronid);
ALTER TABLE ndb.geochronology ADD CONSTRAINT geochronology_unique UNIQUE (sampleid, labnumber);

--- Foreign Key Restraints
ALTER TABLE ndb.geochronology ADD CONSTRAINT fk_geochronology_agetypes FOREIGN KEY (agetypeid) REFERENCES ndb.agetypes(agetypeid);
ALTER TABLE ndb.geochronology ADD CONSTRAINT fk_geochronology_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.geochronology ADD CONSTRAINT fk_geochronology_geochrontypes FOREIGN KEY (geochrontypeid) REFERENCES ndb.geochrontypes(geochrontypeid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.geochronology;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.geochronology;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.geochronology FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.geochronology FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n