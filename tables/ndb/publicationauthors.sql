-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.publicationauthors

CREATE TABLE IF NOT EXISTS ndb.publicationauthors (

    authorid integer DEFAULT nextval('ndb.seq_publicationauthors_authorid'::regclass) NOT NULL,
    publicationid integer NOT NULL,
    authororder integer NULL,
    familyname character varying(80) NULL,
    initials character varying(8) NULL,
    suffix character varying(8) NULL,
    contactid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.publicationauthors IS "This table lists authors as their names are given in publications. Only the initials are stored for authors’ given names. The ContactID links to the author’s full name and contact data in the Contacts table. Thus, for a bibliographic entry, Charles Robert Darwin is listed as C. R. Darwin, or as C. Darwin if the publication did not include his middle name. Book editors are also stored in this table if the entire book is cited. However, if a book chapter or section is cited, authors are stored in this table, but the book editors are stored in the PublicationEditors table. Thus, for the following reference, G. C. Frison is stored in the PublicationAuthors table.
Frison, G. C., editor. 1996. The Mill Iron site. University of New Mexico Press, Albuquerque, New Mexico, USA.
Whereas for the following publication, L. S. Cummings is listed in the PublicationAuthors table, and G. C. Frison is listed in the PublicationEditors table.
Cummings, L. S. 1996. Paleoenvironmental interpretations for the Mill Iron site: stratigraphic pollen and phyrolith analysis. Pages 177-193 in G. C. Frison, editor. The Mill Iron site. University of New Mexico Press, Albuquerque, New Mexico, USA.";

--- Table indices
CREATE UNIQUE INDEX publicationauthors_pkey ON ndb.publicationauthors USING btree (authorid);
CREATE INDEX ix_contactid_publicationauthors ON ndb.publicationauthors USING btree (contactid) WITH (fillfactor='10');
CREATE INDEX ix_publicationid_publicationauthors ON ndb.publicationauthors USING btree (publicationid) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.publicationauthors DROP CONSTRAINT IF EXISTS publicationauthors_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.publicationauthors ADD CONSTRAINT publicationauthors_pkey PRIMARY KEY (authorid);

--- Foreign Key Restraints
ALTER TABLE ndb.publicationauthors ADD CONSTRAINT fk_publicationauthors_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;
ALTER TABLE ndb.publicationauthors ADD CONSTRAINT fk_publicationauthors_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;