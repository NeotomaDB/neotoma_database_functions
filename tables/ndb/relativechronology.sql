-- relativechronology definition

-- Drop table

-- DROP TABLE IF EXISTS relativechronology.relativechronology

CREATE TABLE relativechronology.relativechronology (
    relativechronid integer DEFAULT nextval('ndb.seq_relativechronology_relativechronid'::regclass) NOT NULL,
    analysisunitid integer NOT NULL,
    relativeageid integer NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    chroncontrolid integer NULL,
    CONSTRAINT relativechronology_pkey PRIMARY KEY (relativechronid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.relativechronology ADD CONSTRAINT rc_ccid FOREIGN KEY (chroncontrolid) REFERENCES ndb.chroncontrols(chroncontrolid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.relativechronology ADD CONSTRAINT fk_relativechronology_relativeages FOREIGN KEY (relativeageid) REFERENCES ndb.relativeages(relativeageid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.relativechronology ADD CONSTRAINT fk_relativechronology_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;