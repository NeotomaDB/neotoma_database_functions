-- collectiontypes definition

-- Drop table

-- DROP TABLE IF EXISTS collectiontypes.collectiontypes

CREATE TABLE collectiontypes.collectiontypes (
    colltypeid integer DEFAULT nextval('ndb.seq_collectiontypes_colltypeid'::regclass) NOT NULL,
    colltype character varying(64) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT collectiontypes_pkey PRIMARY KEY (colltypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;