-- ndb.publicationeditors Table definition

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


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.publicationeditors IS 'This table stores the editors of publications for which chapters or sections are the primary bibliographic entries. Chapter authors are stored in the PublicatonAuthors table, where they are linked to the Contacts table. However, publication editors are not cross-referenced in the Contacts table, because chapter authors are the principal citation.';
COMMENT ON COLUMN ndb.publicationeditors.editorid IS 'An arbitrary Editor identification number.';
COMMENT ON COLUMN ndb.publicationeditors.publicationid IS 'Publication identification number. Field links to the Publications table.';
COMMENT ON COLUMN ndb.publicationeditors.editororder IS 'Ordinal number for the position in which the editor’s name appears in the publication’s author list.';
COMMENT ON COLUMN ndb.publicationeditors.familyname IS 'Family name of editor';
COMMENT ON COLUMN ndb.publicationeditors.initials IS 'Initials of editor’s given names';
COMMENT ON COLUMN ndb.publicationeditors.suffix IS 'Authors suffix (e.g. «Jr.»)';
COMMENT ON COLUMN ndb.publicationeditors.recdatecreated IS '';
COMMENT ON COLUMN ndb.publicationeditors.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX publicationeditors_pkey ON ndb.publicationeditors USING btree (editorid);
CREATE INDEX ix_publicationid_publicationeditors ON ndb.publicationeditors USING btree (publicationid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.publicationeditors DROP CONSTRAINT IF EXISTS publicationeditors_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.publicationeditors ADD CONSTRAINT publicationeditors_pkey PRIMARY KEY (editorid);

--- Foreign Key Restraints
ALTER TABLE ndb.publicationeditors ADD CONSTRAINT fk_publicationeditors_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.publicationeditors;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.publicationeditors;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.publicationeditors FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.publicationeditors FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n