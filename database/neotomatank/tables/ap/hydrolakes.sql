-- ap.hydrolakes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ap.hydrolakes

CREATE TABLE IF NOT EXISTS ap.hydrolakes (

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
    shape geometry(MultiPolygon,4326) NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ap.hydrolakes IS "";

--- Table indices
CREATE UNIQUE INDEX hydrolakes_pkey ON ap.hydrolakes USING btree (objectid);
CREATE INDEX hydrolakes_shape_geom_idx ON ap.hydrolakes USING gist (shape);
CREATE INDEX gist_lakes_2geog ON ap.hydrolakes USING gist (((shape)::geography))

--- Remove existing constraints if needed
-- ALTER TABLE ap.hydrolakes DROP CONSTRAINT IF EXISTS hydrolakes_pkey;

--- Non-foreign key constraints
ALTER TABLE ap.hydrolakes ADD CONSTRAINT hydrolakes_pkey PRIMARY KEY (objectid);

--- Foreign Key Restraints

--- Triggers