-- faunranges definition

-- Drop table

-- DROP TABLE IF EXISTS faunranges.faunranges

CREATE TABLE faunranges.faunranges (
    gid integer DEFAULT nextval('ap.faunranges_gid_seq'::regclass) NOT NULL,
    spid character varying(10) NULL,
    sciname character varying(254) NULL,
    the_geom geometry(MultiPolygon,4326) NULL,
    CONSTRAINT faunranges_pkey PRIMARY KEY (gid)
);


-- adempiere.wmv_ghgaudit foreign keys

;