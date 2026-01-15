-- isomaterialanalyzedtypes definition

-- Drop table

-- DROP TABLE IF EXISTS isomaterialanalyzedtypes.isomaterialanalyzedtypes

CREATE TABLE isomaterialanalyzedtypes.isomaterialanalyzedtypes (
    isomatanaltypeid integer DEFAULT nextval('ndb.seq_isomaterialanalyzedtypes_isomatanaltypeid'::regclass) NOT NULL,
    isomaterialanalyzedtype character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isomaterialanalyzedtypes_pkey PRIMARY KEY (isomatanaltypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;