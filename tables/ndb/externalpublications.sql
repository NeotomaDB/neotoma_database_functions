-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.externalpublications

CREATE TABLE IF NOT EXISTS ndb.externalpublications (

    publicationid integer NOT NULL,
    extdatabaseid integer NOT NULL,
    extpublicationid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.externalpublications IS "";

--- Table indices
CREATE UNIQUE INDEX externalpublications_pkey ON ndb.externalpublications USING btree (publicationid, extdatabaseid)

--- Remove existing constraints if needed
ALTER TABLE ndb.externalpublications DROP CONSTRAINT IF EXISTS externalpublications_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.externalpublications ADD CONSTRAINT externalpublications_pkey PRIMARY KEY (publicationid, extdatabaseid);

--- Foreign Key Restraints
ALTER TABLE ndb.externalpublications ADD CONSTRAINT fk_externalpublications_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.externalpublications ADD CONSTRAINT fk_externalpublications_externaldatabases FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid) ON UPDATE CASCADE ON DELETE CASCADE;