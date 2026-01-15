-- hydrolakes definition

-- Drop table

-- DROP TABLE IF EXISTS hydrolakes.hydrolakes

CREATE TABLE hydrolakes.hydrolakes (
    objectid integer DEFAULT nextval('ap.hydrolakes_objectid_seq'::regclass) NOT NULL,
    hylak_id integer NULL,
    lake_name character varying(40) NULL,
    country character varying(35) NULL,
    continent character varying(15) NULL,
    poly_src character varying(10) NULL,
    lake_type smallint NULL,
    grand_id smallint NULL,
    lake_area real NULL,
    shore_len real NULL,
    shore_dev real NULL,
    vol_total real NULL,
    vol_res real NULL,
    vol_src smallint NULL,
    depth_avg real NULL,
    dis_avg real NULL,
    res_time real NULL,
    elevation smallint NULL,
    slope_100 real NULL,
    wshd_area real NULL,
    pour_long double precision NULL,
    pour_lat double precision NULL,
    shape_length double precision NULL,
    shape_area double precision NULL,
    shape geometry(MultiPolygon,4326) NULL,
    CONSTRAINT hydrolakes_pkey PRIMARY KEY (objectid)
);


-- adempiere.wmv_ghgaudit foreign keys

;