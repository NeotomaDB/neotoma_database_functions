-- ndb.eventchronology Table definition

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


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.eventchronology IS '';
COMMENT ON COLUMN ndb.eventchronology.eventchronologyid IS '';
COMMENT ON COLUMN ndb.eventchronology.analysisunitid IS '';
COMMENT ON COLUMN ndb.eventchronology.eventid IS '';
COMMENT ON COLUMN ndb.eventchronology.notes IS '';
COMMENT ON COLUMN ndb.eventchronology.recdatecreated IS '';
COMMENT ON COLUMN ndb.eventchronology.recdatemodified IS '';
COMMENT ON COLUMN ndb.eventchronology.chroncontrolid IS '';

--- Table indices
CREATE UNIQUE INDEX eventchronology_pkey ON ndb.eventchronology USING btree (eventchronologyid);
CREATE UNIQUE INDEX uniqueeventset ON ndb.eventchronology USING btree (analysisunitid, eventid, chroncontrolid);
CREATE INDEX ix_analysisunitid_eventchronology ON ndb.eventchronology USING btree (analysisunitid) WITH (fillfactor='10');
CREATE INDEX ix_eventid_eventchronology ON ndb.eventchronology USING btree (eventid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.eventchronology DROP CONSTRAINT IF EXISTS eventchronology_pkey;
-- ALTER TABLE ndb.eventchronology DROP CONSTRAINT IF EXISTS uniqueeventset;

--- Non-foreign key constraints
ALTER TABLE ndb.eventchronology ADD CONSTRAINT eventchronology_pkey PRIMARY KEY (eventchronologyid);
ALTER TABLE ndb.eventchronology ADD CONSTRAINT uniqueeventset UNIQUE (analysisunitid, eventid, chroncontrolid);

--- Foreign Key Restraints
ALTER TABLE ndb.eventchronology ADD CONSTRAINT evc_evt FOREIGN KEY (eventid) REFERENCES ndb.events(eventid);
ALTER TABLE ndb.eventchronology ADD CONSTRAINT evc_alu FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid);
ALTER TABLE ndb.eventchronology ADD CONSTRAINT evc_ccid FOREIGN KEY (chroncontrolid) REFERENCES ndb.chroncontrols(chroncontrolid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.eventchronology;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.eventchronology;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.eventchronology FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.eventchronology FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n