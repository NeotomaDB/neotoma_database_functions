-- sites definition

-- Drop table

-- DROP TABLE IF EXISTS sites.sites

CREATE TABLE sites.sites (
    siteid integer DEFAULT nextval('ndb.seq_sites_siteid'::regclass) NOT NULL,
    sitename character varying(128) NULL,
    longitudeeast double precision NULL,
    latitudenorth double precision NULL,
    longitudewest double precision NULL,
    latitudesouth double precision NULL,
    altitude double precision NULL,
    area double precision NULL,
    sitedescription text NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    geog geography NULL,
    CONSTRAINT sites_pkey PRIMARY KEY (siteid)
);


-- adempiere.wmv_ghgaudit foreign keys

;