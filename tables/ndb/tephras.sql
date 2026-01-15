-- tephras definition

-- Drop table

-- DROP TABLE IF EXISTS tephras.tephras

CREATE TABLE tephras.tephras (
    tephraid integer DEFAULT nextval('ndb.seq_tephras_tephraid'::regclass) NOT NULL,
    eventid integer NOT NULL,
    analysisunitid integer NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT tephras_pkey PRIMARY KEY (tephraid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.tephras ADD CONSTRAINT fk_tephras_events FOREIGN KEY (eventid) REFERENCES ndb.events(eventid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.tephras ADD CONSTRAINT fk_tephras_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;