-- geochronology definition

-- Drop table

-- DROP TABLE IF EXISTS geochronology.geochronology

CREATE TABLE geochronology.geochronology (
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
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT geochronology_pkey PRIMARY KEY (geochronid),
    CONSTRAINT geochronology_unique UNIQUE (sampleid, labnumber)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.geochronology ADD CONSTRAINT fk_geochronology_agetypes FOREIGN KEY (agetypeid) REFERENCES ndb.agetypes(agetypeid);
ALTER TABLE ndb.geochronology ADD CONSTRAINT fk_geochronology_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.geochronology ADD CONSTRAINT fk_geochronology_geochrontypes FOREIGN KEY (geochrontypeid) REFERENCES ndb.geochrontypes(geochrontypeid) ON UPDATE CASCADE ON DELETE CASCADE;