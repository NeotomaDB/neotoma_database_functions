-- ap.icesheets Table definition

-- Drop table

-- DROP TABLE IF EXISTS ap.icesheets

CREATE TABLE IF NOT EXISTS ap.icesheets (

    gid integer DEFAULT nextval('ap.icesheets_gid_seq'::regclass) NOT NULL,
    area_km2 numeric NULL,
    geom geometry(MultiPolygon,4326) NULL,
    age integer NULL,
    ka numeric NULL,
    cal numeric NULL,
    symb character varying(10) NULL,
    calage integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ap.icesheets IS "";

--- Table indices
CREATE UNIQUE INDEX icesheets_pkey ON ap.icesheets USING btree (gid);
CREATE INDEX icesheets_geom_idx ON ap.icesheets USING gist (geom)

--- Remove existing constraints if needed
-- ALTER TABLE ap.icesheets DROP CONSTRAINT IF EXISTS icesheets_pkey;

--- Non-foreign key constraints
ALTER TABLE ap.icesheets ADD CONSTRAINT icesheets_pkey PRIMARY KEY (gid);

--- Foreign Key Restraints

--- Triggers