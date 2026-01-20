-- ndb definition

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


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.events IS "";

--- Table indices
CREATE UNIQUE INDEX events_pkey ON ndb.events USING btree (eventid)

--- Remove existing constraints if needed
ALTER TABLE ndb.events DROP CONSTRAINT IF EXISTS events_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.events ADD CONSTRAINT events_pkey PRIMARY KEY (eventid);

--- Foreign Key Restraints
ALTER TABLE ndb.events ADD CONSTRAINT fk_events_eventtypes FOREIGN KEY (eventtypeid) REFERENCES ndb.eventtypes(eventtypeid) ON UPDATE CASCADE ON DELETE CASCADE;