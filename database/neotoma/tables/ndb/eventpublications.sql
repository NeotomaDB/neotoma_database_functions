-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.eventpublications

CREATE TABLE IF NOT EXISTS ndb.eventpublications (

    eventid integer NOT NULL,
    publicationid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.eventpublications IS "";

--- Table indices
CREATE UNIQUE INDEX eventpublications_pkey ON ndb.eventpublications USING btree (eventid, publicationid)

--- Remove existing constraints if needed
ALTER TABLE ndb.eventpublications DROP CONSTRAINT IF EXISTS eventpublications_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.eventpublications ADD CONSTRAINT eventpublications_pkey PRIMARY KEY (eventid, publicationid);

--- Foreign Key Restraints
ALTER TABLE ndb.eventpublications ADD CONSTRAINT fk_eventpublications_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.eventpublications ADD CONSTRAINT fk_eventpublications_events FOREIGN KEY (eventid) REFERENCES ndb.events(eventid) ON UPDATE CASCADE ON DELETE CASCADE;