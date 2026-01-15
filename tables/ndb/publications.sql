-- publications definition

-- Drop table

-- DROP TABLE IF EXISTS publications.publications

CREATE TABLE publications.publications (
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
    bibtex character varying NULL,
    CONSTRAINT publications_pkey PRIMARY KEY (publicationid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.publications ADD CONSTRAINT pub_pty FOREIGN KEY (pubtypeid) REFERENCES ndb.publicationtypes(pubtypeid);