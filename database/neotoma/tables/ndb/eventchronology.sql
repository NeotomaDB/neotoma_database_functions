-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.eventchronology

CREATE TABLE IF NOT EXISTS ndb.eventchronology (

    eventchronologyid integer DEFAULT nextval('ndb.seq_eventchronology_eventchronologyid'::regclass) NOT NULL,
    analysisunitid integer NULL,
    eventid integer NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    chroncontrolid integer NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.eventchronology IS "";

--- Table indices
CREATE UNIQUE INDEX eventchronology_pkey ON ndb.eventchronology USING btree (eventchronologyid);
CREATE UNIQUE INDEX uniqueeventset ON ndb.eventchronology USING btree (analysisunitid, eventid, chroncontrolid);
CREATE INDEX ix_analysisunitid_eventchronology ON ndb.eventchronology USING btree (analysisunitid) WITH (fillfactor='10');
CREATE INDEX ix_eventid_eventchronology ON ndb.eventchronology USING btree (eventid) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.eventchronology DROP CONSTRAINT IF EXISTS eventchronology_pkey;
ALTER TABLE ndb.eventchronology DROP CONSTRAINT IF EXISTS uniqueeventset;

--- Non-foreign key constraints
ALTER TABLE ndb.eventchronology ADD CONSTRAINT eventchronology_pkey PRIMARY KEY (eventchronologyid);
ALTER TABLE ndb.eventchronology ADD CONSTRAINT uniqueeventset UNIQUE (analysisunitid, eventid, chroncontrolid);

--- Foreign Key Restraints
ALTER TABLE ndb.eventchronology ADD CONSTRAINT evc_evt FOREIGN KEY (eventid) REFERENCES ndb.events(eventid);
ALTER TABLE ndb.eventchronology ADD CONSTRAINT evc_alu FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid);
ALTER TABLE ndb.eventchronology ADD CONSTRAINT evc_ccid FOREIGN KEY (chroncontrolid) REFERENCES ndb.chroncontrols(chroncontrolid);