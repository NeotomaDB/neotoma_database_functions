-- ndb definition

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


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.geochronology IS "This table stores geochronologic data. Geochronologic measurements are from geochronologic samples, which are from Analysis Units, which may have a depth and thickness. Geochronologic measurements may be from the same or different Analysis Units as fossils. In the case of faunal excavations, geochronologic samples are typically from the same Analysis Units as the fossils, and there may be multiple geochronologic samples from a single Analysis Unit. In the case of cores used for microfossil analysis, geochronologic samples are often from separate Analysis Units; dated core sections are often thicker than microfossil Analysis Units.";

--- Table indices
CREATE UNIQUE INDEX geochronology_pkey ON ndb.geochronology USING btree (geochronid);
CREATE INDEX geoage_idx ON ndb.geochronology USING btree (age);
CREATE INDEX ix_sampleid_geochronology ON ndb.geochronology USING btree (sampleid) WITH (fillfactor='10');
CREATE INDEX geochronology_labnumber_idx ON ndb.geochronology USING btree (labnumber);
CREATE UNIQUE INDEX geochronology_unique ON ndb.geochronology USING btree (sampleid, labnumber)

--- Remove existing constraints if needed
ALTER TABLE ndb.geochronology DROP CONSTRAINT IF EXISTS geochronology_pkey;
ALTER TABLE ndb.geochronology DROP CONSTRAINT IF EXISTS geochronology_unique;

--- Non-foreign key constraints
ALTER TABLE ndb.geochronology ADD CONSTRAINT geochronology_pkey PRIMARY KEY (geochronid);
ALTER TABLE ndb.geochronology ADD CONSTRAINT geochronology_unique UNIQUE (sampleid, labnumber);

--- Foreign Key Restraints
ALTER TABLE ndb.geochronology ADD CONSTRAINT fk_geochronology_agetypes FOREIGN KEY (agetypeid) REFERENCES ndb.agetypes(agetypeid);
ALTER TABLE ndb.geochronology ADD CONSTRAINT fk_geochronology_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.geochronology ADD CONSTRAINT fk_geochronology_geochrontypes FOREIGN KEY (geochrontypeid) REFERENCES ndb.geochrontypes(geochrontypeid) ON UPDATE CASCADE ON DELETE CASCADE;