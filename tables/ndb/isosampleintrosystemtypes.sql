-- isosampleintrosystemtypes definition

-- Drop table

-- DROP TABLE IF EXISTS isosampleintrosystemtypes.isosampleintrosystemtypes

CREATE TABLE isosampleintrosystemtypes.isosampleintrosystemtypes (
    isosampleintrosystemtypeid integer DEFAULT nextval('ndb.seq_isosampleintrosystemtypes_isosampleintrosystemtypeid'::regclass) NOT NULL,
    isosampleintrosystemtype character varying(256) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isosampleintrosystemtypes_pkey PRIMARY KEY (isosampleintrosystemtypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;