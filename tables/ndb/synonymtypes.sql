-- synonymtypes definition

-- Drop table

-- DROP TABLE IF EXISTS synonymtypes.synonymtypes

CREATE TABLE synonymtypes.synonymtypes (
    synonymtypeid integer DEFAULT nextval('ndb.seq_synonymtypes_synonymtypeid'::regclass) NOT NULL,
    synonymtype character varying(255) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT synonymtypes_pkey PRIMARY KEY (synonymtypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;