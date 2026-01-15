-- samples definition

-- Drop table

-- DROP TABLE IF EXISTS samples.samples

CREATE TABLE samples.samples (
    sampleid integer DEFAULT nextval('ndb.seq_samples_sampleid'::regclass) NOT NULL,
    analysisunitid integer NOT NULL,
    datasetid integer NOT NULL,
    samplename character varying(80) NULL,
    analysisdate date NULL,
    labnumber character varying(40) NULL,
    preparationmethod text NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    sampledate date NULL,
    taxonid integer NULL,
    CONSTRAINT samples_pkey PRIMARY KEY (sampleid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.samples ADD CONSTRAINT fk_samples_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid);
ALTER TABLE ndb.samples ADD CONSTRAINT fk_samples_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.samples ADD CONSTRAINT fk_samples_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;