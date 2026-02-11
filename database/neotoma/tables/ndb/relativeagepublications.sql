-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.relativeagepublications

CREATE TABLE IF NOT EXISTS ndb.relativeagepublications (

    relativeageid integer NOT NULL,
    publicationid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.relativeagepublications IS "This table stores Publications in which Relative Ages are reported for CollectionUnits.";

--- Table indices
CREATE UNIQUE INDEX relativeagepublications_pkey ON ndb.relativeagepublications USING btree (relativeageid, publicationid);
CREATE INDEX ix_relativeageid_relativeagepublications ON ndb.relativeagepublications USING btree (relativeageid) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.relativeagepublications DROP CONSTRAINT IF EXISTS relativeagepublications_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.relativeagepublications ADD CONSTRAINT relativeagepublications_pkey PRIMARY KEY (relativeageid, publicationid);

--- Foreign Key Restraints
ALTER TABLE ndb.relativeagepublications ADD CONSTRAINT fk_relativeagepublications_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.relativeagepublications ADD CONSTRAINT fk_relativeagepublications_relativeages FOREIGN KEY (relativeageid) REFERENCES ndb.relativeages(relativeageid) ON UPDATE CASCADE ON DELETE CASCADE;