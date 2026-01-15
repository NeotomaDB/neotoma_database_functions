-- isosampleorigintypes definition

-- Drop table

-- DROP TABLE IF EXISTS isosampleorigintypes.isosampleorigintypes

CREATE TABLE isosampleorigintypes.isosampleorigintypes (
    isosampleorigintypeid integer DEFAULT nextval('ndb.seq_isosampleorigintypes_isosampleorigintypeid'::regclass) NOT NULL,
    isosampleorigintype character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isosampleorigintypes_pkey PRIMARY KEY (isosampleorigintypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;