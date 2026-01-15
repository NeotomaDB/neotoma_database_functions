-- globalmammals definition

-- Drop table

-- DROP TABLE IF EXISTS globalmammals.globalmammals

CREATE TABLE globalmammals.globalmammals (
    fid integer DEFAULT nextval('ap.globalmammals_fid_seq'::regclass) NOT NULL,
    sciname character varying NULL,
    "order" character varying NULL,
    family character varying NULL,
    author character varying NULL,
    year double precision NULL,
    citation character varying NULL,
    rec_source character varying NULL,
    geom geometry(MultiPolygon,4326) NULL,
    CONSTRAINT globalmammals_pkey PRIMARY KEY (fid)
);


-- adempiere.wmv_ghgaudit foreign keys

;