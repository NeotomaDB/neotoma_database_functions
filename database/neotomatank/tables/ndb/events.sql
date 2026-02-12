-- ndb.events Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.events

CREATE TABLE IF NOT EXISTS ndb.events (

    eventid integer DEFAULT nextval('ndb.seq_events_eventid'::regclass) NOT NULL,
    eventtypeid integer NOT NULL,
    eventname character varying(80) NOT NULL,
    c14age double precision NULL,
    c14ageyounger double precision NULL,
    c14ageolder double precision NULL,
    calage double precision NULL,
    calageyounger double precision NULL,
    calageolder double precision NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.events IS '';
COMMENT ON COLUMN ndb.events.eventid IS '';
COMMENT ON COLUMN ndb.events.eventtypeid IS '';
COMMENT ON COLUMN ndb.events.eventname IS '';
COMMENT ON COLUMN ndb.events.c14age IS '';
COMMENT ON COLUMN ndb.events.c14ageyounger IS '';
COMMENT ON COLUMN ndb.events.c14ageolder IS '';
COMMENT ON COLUMN ndb.events.calage IS '';
COMMENT ON COLUMN ndb.events.calageyounger IS '';
COMMENT ON COLUMN ndb.events.calageolder IS '';
COMMENT ON COLUMN ndb.events.notes IS '';
COMMENT ON COLUMN ndb.events.recdatecreated IS '';
COMMENT ON COLUMN ndb.events.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX events_pkey ON ndb.events USING btree (eventid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.events DROP CONSTRAINT IF EXISTS events_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.events ADD CONSTRAINT events_pkey PRIMARY KEY (eventid);

--- Foreign Key Restraints
ALTER TABLE ndb.events ADD CONSTRAINT fk_events_eventtypes FOREIGN KEY (eventtypeid) REFERENCES ndb.eventtypes(eventtypeid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.events;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.events;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.events FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.events FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n