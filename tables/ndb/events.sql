-- events definition

-- Drop table

-- DROP TABLE IF EXISTS events.events

CREATE TABLE events.events (
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
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT events_pkey PRIMARY KEY (eventid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.events ADD CONSTRAINT fk_events_eventtypes FOREIGN KEY (eventtypeid) REFERENCES ndb.eventtypes(eventtypeid) ON UPDATE CASCADE ON DELETE CASCADE;