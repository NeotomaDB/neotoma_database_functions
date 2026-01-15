-- publicationtranslators definition

-- Drop table

-- DROP TABLE IF EXISTS publicationtranslators.publicationtranslators

CREATE TABLE publicationtranslators.publicationtranslators (
    translatorid integer DEFAULT nextval('ndb.seq_publicationtranslators_translatorid'::regclass) NOT NULL,
    publicationid integer NOT NULL,
    translatororder integer NULL,
    familyname character varying(64) NULL,
    initials character varying(8) NULL,
    suffix character varying(8) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT publicationtranslators_pkey PRIMARY KEY (translatorid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.publicationtranslators ADD CONSTRAINT fk_publicationtranslators_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;