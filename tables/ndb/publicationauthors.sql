-- publicationauthors definition

-- Drop table

-- DROP TABLE IF EXISTS publicationauthors.publicationauthors

CREATE TABLE publicationauthors.publicationauthors (
    authorid integer DEFAULT nextval('ndb.seq_publicationauthors_authorid'::regclass) NOT NULL,
    publicationid integer NOT NULL,
    authororder integer NULL,
    familyname character varying(80) NULL,
    initials character varying(8) NULL,
    suffix character varying(8) NULL,
    contactid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT publicationauthors_pkey PRIMARY KEY (authorid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.publicationauthors ADD CONSTRAINT fk_publicationauthors_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;
ALTER TABLE ndb.publicationauthors ADD CONSTRAINT fk_publicationauthors_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;