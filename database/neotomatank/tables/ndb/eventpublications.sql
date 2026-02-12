-- ndb.eventpublications Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.eventpublications

CREATE TABLE IF NOT EXISTS ndb.eventpublications (

    eventid integer NOT NULL,
    publicationid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.eventpublications IS '';
COMMENT ON COLUMN ndb.eventpublications.eventid IS '';
COMMENT ON COLUMN ndb.eventpublications.publicationid IS '';
COMMENT ON COLUMN ndb.eventpublications.recdatecreated IS '';
COMMENT ON COLUMN ndb.eventpublications.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX eventpublications_pkey ON ndb.eventpublications USING btree (eventid, publicationid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.eventpublications DROP CONSTRAINT IF EXISTS eventpublications_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.eventpublications ADD CONSTRAINT eventpublications_pkey PRIMARY KEY (eventid, publicationid);

--- Foreign Key Restraints
ALTER TABLE ndb.eventpublications ADD CONSTRAINT fk_eventpublications_events FOREIGN KEY (eventid) REFERENCES ndb.events(eventid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.eventpublications ADD CONSTRAINT fk_eventpublications_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.eventpublications;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.eventpublications;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.eventpublications FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.eventpublications FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n