-- chroncontrols definition

-- Drop table

-- DROP TABLE IF EXISTS chroncontrols.chroncontrols

CREATE TABLE chroncontrols.chroncontrols (
    chroncontrolid integer DEFAULT nextval('ndb.seq_chroncontrols_chroncontrolid'::regclass) NOT NULL,
    chronologyid integer NOT NULL,
    chroncontroltypeid integer NULL,
    depth double precision NULL,
    thickness double precision NULL,
    age double precision NULL,
    agelimityounger double precision NULL,
    agelimitolder double precision NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    analysisunitid integer NULL,
    agetypeid integer NULL,
    CONSTRAINT chroncontrols_pkey PRIMARY KEY (chroncontrolid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.chroncontrols ADD CONSTRAINT fk_chroncontrols_agetypes FOREIGN KEY (agetypeid) REFERENCES ndb.agetypes(agetypeid);
ALTER TABLE ndb.chroncontrols ADD CONSTRAINT fk_chroncontrols_chroncontroltypes FOREIGN KEY (chroncontroltypeid) REFERENCES ndb.chroncontroltypes(chroncontroltypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrols ADD CONSTRAINT fk_chroncontrols_chronologies FOREIGN KEY (chronologyid) REFERENCES ndb.chronologies(chronologyid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrols ADD CONSTRAINT fk_chroncontrols_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;