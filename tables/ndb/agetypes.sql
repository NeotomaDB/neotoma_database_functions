-- agetypes definition

-- Drop table

-- DROP TABLE IF EXISTS agetypes.agetypes

CREATE TABLE agetypes.agetypes (
    agetypeid integer DEFAULT nextval('ndb.seq_agetypes_agetypeid'::regclass) NOT NULL,
    agetype character varying(64) NOT NULL,
    precedence integer NULL,
    shortagetype character varying(32) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT agetypes_pkey PRIMARY KEY (agetypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;