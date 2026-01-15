-- publicationeditors definition

-- Drop table

-- DROP TABLE IF EXISTS publicationeditors.publicationeditors

CREATE TABLE publicationeditors.publicationeditors (
    editorid integer DEFAULT nextval('ndb.seq_publicationeditors_editorid'::regclass) NOT NULL,
    publicationid integer NOT NULL,
    editororder integer NULL,
    familyname character varying(64) NULL,
    initials character varying(8) NULL,
    suffix character varying(8) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT publicationeditors_pkey PRIMARY KEY (editorid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.publicationeditors ADD CONSTRAINT fk_publicationeditors_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;