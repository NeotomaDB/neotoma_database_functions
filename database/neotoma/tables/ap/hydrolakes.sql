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
COMMENT ON TABLE ap.hydrolakes IS '';
COMMENT ON COLUMN ap.hydrolakes.objectid IS '';
COMMENT ON COLUMN ap.hydrolakes.hylak_id IS '';
COMMENT ON COLUMN ap.hydrolakes.lake_name IS '';
COMMENT ON COLUMN ap.hydrolakes.country IS '';
COMMENT ON COLUMN ap.hydrolakes.continent IS '';
COMMENT ON COLUMN ap.hydrolakes.poly_src IS '';
COMMENT ON COLUMN ap.hydrolakes.lake_type IS '';
COMMENT ON COLUMN ap.hydrolakes.grand_id IS '';
COMMENT ON COLUMN ap.hydrolakes.lake_area IS '';
COMMENT ON COLUMN ap.hydrolakes.shore_len IS '';
COMMENT ON COLUMN ap.hydrolakes.shore_dev IS '';
COMMENT ON COLUMN ap.hydrolakes.vol_total IS '';
COMMENT ON COLUMN ap.hydrolakes.vol_res IS '';
COMMENT ON COLUMN ap.hydrolakes.vol_src IS '';
COMMENT ON COLUMN ap.hydrolakes.depth_avg IS '';
COMMENT ON COLUMN ap.hydrolakes.dis_avg IS '';
COMMENT ON COLUMN ap.hydrolakes.res_time IS '';
COMMENT ON COLUMN ap.hydrolakes.elevation IS '';
COMMENT ON COLUMN ap.hydrolakes.slope_100 IS '';
COMMENT ON COLUMN ap.hydrolakes.wshd_area IS '';
COMMENT ON COLUMN ap.hydrolakes.pour_long IS '';
COMMENT ON COLUMN ap.hydrolakes.pour_lat IS '';
COMMENT ON COLUMN ap.hydrolakes.shape_length IS '';
COMMENT ON COLUMN ap.hydrolakes.shape_area IS '';
COMMENT ON COLUMN ap.hydrolakes.shape IS '';

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