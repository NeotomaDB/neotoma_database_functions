-- geopoliticalunits definition

-- Drop table

-- DROP TABLE IF EXISTS geopoliticalunits.geopoliticalunits

CREATE TABLE geopoliticalunits.geopoliticalunits (
    geopoliticalid integer DEFAULT nextval('ndb.seq_geopoliticalunits_geopoliticalid'::regclass) NOT NULL,
    geopoliticalname character varying(255) NOT NULL,
    geopoliticalunit character varying(255) NULL,
    rank integer NOT NULL,
    highergeopoliticalid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT geopoliticalunits_pkey PRIMARY KEY (geopoliticalid)
);


-- adempiere.wmv_ghgaudit foreign keys

;