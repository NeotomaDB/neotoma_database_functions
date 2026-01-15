-- eventpublications definition

-- Drop table

-- DROP TABLE IF EXISTS eventpublications.eventpublications

CREATE TABLE eventpublications.eventpublications (
    eventid integer NOT NULL,
    publicationid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT eventpublications_pkey PRIMARY KEY (eventid, publicationid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.eventpublications ADD CONSTRAINT fk_eventpublications_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.eventpublications ADD CONSTRAINT fk_eventpublications_events FOREIGN KEY (eventid) REFERENCES ndb.events(eventid) ON UPDATE CASCADE ON DELETE CASCADE;