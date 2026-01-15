-- faciestypes definition

-- Drop table

-- DROP TABLE IF EXISTS faciestypes.faciestypes

CREATE TABLE faciestypes.faciestypes (
    faciesid integer DEFAULT nextval('ndb.seq_faciestypes_faciesid'::regclass) NOT NULL,
    facies character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT faciestypes_pkey PRIMARY KEY (faciesid)
);


-- adempiere.wmv_ghgaudit foreign keys

;