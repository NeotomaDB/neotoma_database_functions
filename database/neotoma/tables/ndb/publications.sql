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
COMMENT ON TABLE ndb.publications IS 'This table stores publication or bibliographic data. The table is designed with fields for bibliographic data so that bibliographies can be formatted in different styles and potentially exported to bibliographic software such EndNote®. In the constituent databases that were originally merged into Neotoma, bibliographic entries were not parsed into separate fields, but rather were stored as free-form text. Because complete parsing of these thousands of legacy bibliographic entries into individual fields would have been prohibitively time consuming, the existing bibliographic data were ingested “as is” with a PubTypeID = Other. However, for legacy publications, the year of publication was added to the Year field, and authors were parsed into the PublicationAuthors table and added to the Contacts table. In addition, some global changes were made. For example, «Pp.» was changed to «Pages», «Ed.» to «Editor», and «Eds.» to «Editors». Also for FAUNMAP entries, abbreviated journal names were changed to fully spelled out names.
The merged databases used different bibliographic styles, and data entry personnel working on the same database sometimes followed different conventions. Consequently, the current bibliographic entries are not stylistically uniform. Eventually, the legacy bibliographic data will be parsed into separate fields.
The Publications table has fields to accommodate a number of different types of publications. Some fields contain different kinds of data for different kinds of publications. For example, the BookTitle field stores the titles of books, but stores the journal name for journal articles. The Publisher field stores the name of the publisher for books, but the name of the university for theses and dissertations.
Authors are stored in the PublicationAuthors table. Editors are also stored in the PublicationAuthors table if the entire publication is cited. The PublicationAuthors table has a ContactID field, which links to the Contacts table, where full names and contact information is stored for authors and editors. The PubTypeID «Authored Book» or «Edited Book» indicates whether the Publication Authors records are authors or editors. If a book chapter or section is the primary bibliographic entry, then the book editors are stored in the PublicationEditors table, which does not have a ContactID field.';
COMMENT ON COLUMN ndb.publications.publicationid IS 'An arbitrary Publication identification number.';
COMMENT ON COLUMN ndb.publications.pubtypeid IS 'Publication type. Field links to the PublicationTypes lookup table.';
COMMENT ON COLUMN ndb.publications.year IS 'Year of publication.';
COMMENT ON COLUMN ndb.publications.citation IS 'The complete citation in a standard style. For Legacy citations inherited from other databases, this field holds the citation as ingested from the other databases';
COMMENT ON COLUMN ndb.publications.articletitle IS 'The title of a journal or book chapter article.';
COMMENT ON COLUMN ndb.publications.journal IS '';
COMMENT ON COLUMN ndb.publications.volume IS 'The volume number of a journal or the volume number of a book in a set. A set of books is comprised of a fixed number of volumes and normally have ISBN numbers, not ISSN numbers. Book sets are often published simultaneously, but not necessarily. For instance, many floras, such as The Flora of North America north of Mexico and Flora Europaea, consist of a set number of volumes planned in advance but published over a period of years.';
COMMENT ON COLUMN ndb.publications.issue IS 'Journal issue number, normally included only if issues are independently paginated.';
COMMENT ON COLUMN ndb.publications.pages IS 'Page numbers for journal or book chapter articles, or the number of pages in theses, dissertations, and reports.';
COMMENT ON COLUMN ndb.publications.citationnumber IS 'A citation or article number used in lieu of page numbers for digital or online publications, typically used in conjunction with the DOI. For example, journals published by the American Geophysical Union since 1999 use citation numbers rather than page numbers.';
COMMENT ON COLUMN ndb.publications.doi IS 'Digital Object Identifier. A unique identifier assigned to digital publications. The DOI consists of a prefix and suffix separated by a slash. The portion before the slash stands for the publisher and is assigned by the International DOI Foundation. For example, 10.1029 is the prefix for the American Geophysical Union. The suffix is assigned by the publisher according to their protocols. For example, the DOI 10.1029/2002PA000768 is for an article submitted to Paleoceanography in 2002 and is article number 768 submitted since the system was installed. An example of CitationNumber and DOI:
Barron, J. A., L. Heusser, T. Herbert, and M. Lyle. 2003. High-resolution climatic evolution of coastal northern California during the past 16,000 years, Paleoceanography 18(1):1020. DOI:10.1029/2002PA000768.
';
COMMENT ON COLUMN ndb.publications.booktitle IS 'The title of a book or journal';
COMMENT ON COLUMN ndb.publications.numvolumes IS 'Number of volumes in a set of books. Used when the entire set is referenced. An example of NumVolumes and Edition:
Wilson, D. E., and D. M. Reeder. 2005. Mammal species of the world: a taxonomic and geographic reference. Third edition. 2 volumes. The Johns Hopkins University Press, Baltimore, Maryland, USA.
';
COMMENT ON COLUMN ndb.publications.edition IS 'Edition of a publication.';
COMMENT ON COLUMN ndb.publications.volumetitle IS 'Title of a book volume in a set. Used if the individual volume is referenced. Example of Volume and VolumeTitle:
Flora of North America Editorial Committee. 2002. Flora of North America north of Mexico. Volume 26. Magnoliophyta: Liliidae: Liliales and Orchidales. Oxford University Press, New York, New York, USA.
';
COMMENT ON COLUMN ndb.publications.seriestitle IS 'Title of a book series. Book series consist of a series of books, typically published at irregular intervals on sometimes related but different topics. The number of volumes in a series is typically open ended. Book series are often assigned ISSN numbers as well as ISBN numbers. However, in contrast to most serials, book series have individual titles and authors or editors. Citation practices for book series vary; sometimes they are cited as books, other times as journals. The default citation for Neotoma includes all information. An example of SeriesTitle and SeriesVolume:
Curtis, J. H., and D. A. Hodell. 1993. An isotopic and trace element study of ostracods from Lake Miragoane, Haiti: A 10,500 year record of paleosalinity and paleotemperature changes in the Caribbean. Pages 135-152 in P. K. Swart, K. C. Lohmann, J. McKensie, and S. Savin, editors. Climate change in continental isotopic records. Geophysical Monograph 78. American Geophysical Union, Washington, D.C., USA.
';
COMMENT ON COLUMN ndb.publications.seriesvolume IS 'Volume number in a series.';
COMMENT ON COLUMN ndb.publications.publisher IS 'Publisher, including commercial publishing houses, university presses, government agencies, and non-governmental organizations, generally the owner of the copyright.';
COMMENT ON COLUMN ndb.publications.url IS '';
COMMENT ON COLUMN ndb.publications.city IS 'City in which the publication was published. The first city if a list is given.';
COMMENT ON COLUMN ndb.publications.state IS 'State or province in which the publication was published. Used for the United States and Canada, not used for many countries.';
COMMENT ON COLUMN ndb.publications.country IS 'Country in which the publication was published, generally the complete country name, but «USA» for the United States.';
COMMENT ON COLUMN ndb.publications.originallanguage IS 'The original language if the publication or bibliographic citation is translated from another language or transliterated from a non-Latin character set. Field not needed for non-translated publications in languages using the Latin character set. In the following example, the ArticleTitle is translated from Russian to English and the BookTitle (journal name) is transliterated from Russian:
Tarasov, P.E. 1991. Late Holocene features of the Kokchetav Highland. Vestnik Moskovskogo Universiteta. Series 5. Geography 6:54-60 [in Russian].
';
COMMENT ON COLUMN ndb.publications.notes IS 'Free form notes or comments about the publication, which may be added parenthetically to the citation.';
COMMENT ON COLUMN ndb.publications.recdatecreated IS '';
COMMENT ON COLUMN ndb.publications.recdatemodified IS '';
COMMENT ON COLUMN ndb.publications.crossref IS '';
COMMENT ON COLUMN ndb.publications.bibtex IS '';

--- Table indices
CREATE UNIQUE INDEX publications_pkey ON ndb.publications USING btree (publicationid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.publications DROP CONSTRAINT IF EXISTS publications_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.publications ADD CONSTRAINT publications_pkey PRIMARY KEY (publicationid);

--- Foreign Key Restraints
ALTER TABLE ndb.publications ADD CONSTRAINT pub_pty FOREIGN KEY (pubtypeid) REFERENCES ndb.publicationtypes(pubtypeid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.publications;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.publications;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.publications FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.publications FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n