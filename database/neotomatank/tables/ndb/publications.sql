-- ndb.publications Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.publications

CREATE TABLE IF NOT EXISTS ndb.publications (

    publicationid integer DEFAULT nextval('ndb.seq_publications_publicationid'::regclass) NOT NULL,
    pubtypeid integer NULL,
    year character varying(64) NULL,
    citation text NULL,
    articletitle text NULL,
    journal text NULL,
    volume character varying(16) NULL,
    issue character varying(8) NULL,
    pages character varying(24) NULL,
    citationnumber character varying(24) NULL,
    doi character varying(128) NULL,
    booktitle text NULL,
    numvolumes character varying(8) NULL,
    edition character varying(24) NULL,
    volumetitle text NULL,
    seriestitle text NULL,
    seriesvolume character varying(24) NULL,
    publisher character varying(255) NULL,
    url text NULL,
    city character varying(64) NULL,
    state character varying(64) NULL,
    country character varying(64) NULL,
    originallanguage character varying(64) NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    crossref jsonb NULL,
    bibtex character varying NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.publications IS "This table stores publication or bibliographic data. The table is designed with fields for bibliographic data so that bibliographies can be formatted in different styles and potentially exported to bibliographic software such EndNote®. In the constituent databases that were originally merged into Neotoma, bibliographic entries were not parsed into separate fields, but rather were stored as free-form text. Because complete parsing of these thousands of legacy bibliographic entries into individual fields would have been prohibitively time consuming, the existing bibliographic data were ingested “as is” with a PubTypeID = Other. However, for legacy publications, the year of publication was added to the Year field, and authors were parsed into the PublicationAuthors table and added to the Contacts table. In addition, some global changes were made. For example, «Pp.» was changed to «Pages», «Ed.» to «Editor», and «Eds.» to «Editors». Also for FAUNMAP entries, abbreviated journal names were changed to fully spelled out names.
The merged databases used different bibliographic styles, and data entry personnel working on the same database sometimes followed different conventions. Consequently, the current bibliographic entries are not stylistically uniform. Eventually, the legacy bibliographic data will be parsed into separate fields.
The Publications table has fields to accommodate a number of different types of publications. Some fields contain different kinds of data for different kinds of publications. For example, the BookTitle field stores the titles of books, but stores the journal name for journal articles. The Publisher field stores the name of the publisher for books, but the name of the university for theses and dissertations.
Authors are stored in the PublicationAuthors table. Editors are also stored in the PublicationAuthors table if the entire publication is cited. The PublicationAuthors table has a ContactID field, which links to the Contacts table, where full names and contact information is stored for authors and editors. The PubTypeID «Authored Book» or «Edited Book» indicates whether the Publication Authors records are authors or editors. If a book chapter or section is the primary bibliographic entry, then the book editors are stored in the PublicationEditors table, which does not have a ContactID field.";

--- Table indices
CREATE UNIQUE INDEX publications_pkey ON ndb.publications USING btree (publicationid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.publications DROP CONSTRAINT IF EXISTS publications_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.publications ADD CONSTRAINT publications_pkey PRIMARY KEY (publicationid);

--- Foreign Key Restraints
ALTER TABLE ndb.publications ADD CONSTRAINT pub_pty FOREIGN KEY (pubtypeid) REFERENCES ndb.publicationtypes(pubtypeid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.publications;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.publications;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.publications FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.publications FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();