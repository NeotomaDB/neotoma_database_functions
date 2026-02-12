-- ndb.tephras Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.tephras

CREATE TABLE IF NOT EXISTS ndb.tephras (

    tephraid integer DEFAULT nextval('ndb.seq_tephras_tephraid'::regclass) NOT NULL,
    eventid integer NOT NULL,
    analysisunitid integer NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.tephras IS 'Tephras lookup table. This table stores recognized tephras with established ages. Referenced by the Tephrachronology table.';
COMMENT ON COLUMN ndb.tephras.tephraid IS 'An arbitrary Tephra identification number.';
COMMENT ON COLUMN ndb.tephras.eventid IS '';
COMMENT ON COLUMN ndb.tephras.analysisunitid IS '';
COMMENT ON COLUMN ndb.tephras.notes IS 'Free form notes or comments about the tephra.';
COMMENT ON COLUMN ndb.tephras.recdatecreated IS '';
COMMENT ON COLUMN ndb.tephras.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX tephras_pkey ON ndb.tephras USING btree (tephraid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.tephras DROP CONSTRAINT IF EXISTS tephras_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.tephras ADD CONSTRAINT tephras_pkey PRIMARY KEY (tephraid);

--- Foreign Key Restraints
ALTER TABLE ndb.tephras ADD CONSTRAINT fk_tephras_events FOREIGN KEY (eventid) REFERENCES ndb.events(eventid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.tephras ADD CONSTRAINT fk_tephras_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.tephras;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.tephras;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.tephras FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.tephras FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n