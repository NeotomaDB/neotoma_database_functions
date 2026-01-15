-- icesheets definition

-- Drop table

-- DROP TABLE IF EXISTS icesheets.icesheets

CREATE TABLE icesheets.icesheets (
    gid integer DEFAULT nextval('ap.icesheets_gid_seq'::regclass) NOT NULL,
    area_km2 numeric NULL,
    geom geometry(MultiPolygon,4326) NULL,
    age integer NULL,
    ka numeric NULL,
    cal numeric NULL,
    symb character varying(10) NULL,
    calage integer NULL,
    CONSTRAINT icesheets_pkey PRIMARY KEY (gid)
);


-- adempiere.wmv_ghgaudit foreign keys

;