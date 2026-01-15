-- eventchronology definition

-- Drop table

-- DROP TABLE IF EXISTS eventchronology.eventchronology

CREATE TABLE eventchronology.eventchronology (
    eventchronologyid integer DEFAULT nextval('ndb.seq_eventchronology_eventchronologyid'::regclass) NOT NULL,
    analysisunitid integer NULL,
    eventid integer NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    chroncontrolid integer NOT NULL,
    CONSTRAINT eventchronology_pkey PRIMARY KEY (eventchronologyid),
    CONSTRAINT uniqueeventset UNIQUE (analysisunitid, eventid, chroncontrolid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.eventchronology ADD CONSTRAINT evc_evt FOREIGN KEY (eventid) REFERENCES ndb.events(eventid);
ALTER TABLE ndb.eventchronology ADD CONSTRAINT evc_alu FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid);
ALTER TABLE ndb.eventchronology ADD CONSTRAINT evc_ccid FOREIGN KEY (chroncontrolid) REFERENCES ndb.chroncontrols(chroncontrolid);