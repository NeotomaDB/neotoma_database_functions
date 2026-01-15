-- publicationtypes definition

-- Drop table

-- DROP TABLE IF EXISTS publicationtypes.publicationtypes

CREATE TABLE publicationtypes.publicationtypes (
    pubtypeid integer DEFAULT nextval('ndb.seq_publicationtypes_pubtypeid'::regclass) NOT NULL,
    pubtype character varying(24) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT publicationtypes_pkey PRIMARY KEY (pubtypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;