-- sampleages definition

-- Drop table

-- DROP TABLE IF EXISTS sampleages.sampleages

CREATE TABLE sampleages.sampleages (
    sampleageid integer DEFAULT nextval('ndb.seq_sampleages_sampleageid'::regclass) NOT NULL,
    sampleid integer NOT NULL,
    chronologyid integer NOT NULL,
    age double precision NULL,
    ageyounger double precision NULL,
    ageolder double precision NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT sampleages_pkey PRIMARY KEY (sampleageid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.sampleages ADD CONSTRAINT fk_sampleages_chronologies FOREIGN KEY (chronologyid) REFERENCES ndb.chronologies(chronologyid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.sampleages ADD CONSTRAINT fk_sampleages_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;