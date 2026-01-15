-- geochrontypes definition

-- Drop table

-- DROP TABLE IF EXISTS geochrontypes.geochrontypes

CREATE TABLE geochrontypes.geochrontypes (
    geochrontypeid integer DEFAULT nextval('ndb.seq_geochrontypes_geochrontypeid'::regclass) NOT NULL,
    geochrontype character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT geochrontypes_pkey PRIMARY KEY (geochrontypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;