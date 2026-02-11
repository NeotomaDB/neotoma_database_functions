-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.publicationeditors

CREATE TABLE IF NOT EXISTS ndb.publicationeditors (

    editorid integer DEFAULT nextval('ndb.seq_publicationeditors_editorid'::regclass) NOT NULL,
    publicationid integer NOT NULL,
    editororder integer NULL,
    familyname character varying(64) NULL,
    initials character varying(8) NULL,
    suffix character varying(8) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.publicationeditors IS "This table stores the editors of publications for which chapters or sections are the primary bibliographic entries. Chapter authors are stored in the PublicatonAuthors table, where they are linked to the Contacts table. However, publication editors are not cross-referenced in the Contacts table, because chapter authors are the principal citation.";

--- Table indices
CREATE UNIQUE INDEX publicationeditors_pkey ON ndb.publicationeditors USING btree (editorid);
CREATE INDEX ix_publicationid_publicationeditors ON ndb.publicationeditors USING btree (publicationid) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.publicationeditors DROP CONSTRAINT IF EXISTS publicationeditors_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.publicationeditors ADD CONSTRAINT publicationeditors_pkey PRIMARY KEY (editorid);

--- Foreign Key Restraints
ALTER TABLE ndb.publicationeditors ADD CONSTRAINT fk_publicationeditors_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;