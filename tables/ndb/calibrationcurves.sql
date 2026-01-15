-- calibrationcurves definition

-- Drop table

-- DROP TABLE IF EXISTS calibrationcurves.calibrationcurves

CREATE TABLE calibrationcurves.calibrationcurves (
    calibrationcurveid integer DEFAULT nextval('ndb.seq_calibrationcurves_calibrationcurveid'::regclass) NOT NULL,
    calibrationcurve character varying(24) NOT NULL,
    publicationid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT calibrationcurves_pkey PRIMARY KEY (calibrationcurveid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.calibrationcurves ADD CONSTRAINT fk_calibrationcurves_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;