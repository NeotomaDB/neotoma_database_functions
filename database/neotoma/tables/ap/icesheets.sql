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
COMMENT ON TABLE ap.icesheets IS 'A spatial layer to render glacial extents as part of the Neotoma Explorer after Dyke et al. 2002.';
COMMENT ON COLUMN ap.icesheets.gid IS 'Unique numerical index for the layer.';
COMMENT ON COLUMN ap.icesheets.area_km2 IS 'Total area of the layer in square kilometers.';
COMMENT ON COLUMN ap.icesheets.geom IS 'Multipolygon using EPSG:4326 representing the ice sheet at the indicated time period.';
COMMENT ON COLUMN ap.icesheets.age IS 'Age in radiocarbon years before present of the ice sheet extent.';
COMMENT ON COLUMN ap.icesheets.ka IS 'Age expressed in thousands of radiocarbon years before present.';
COMMENT ON COLUMN ap.icesheets.cal IS 'Layer age in calibrated radiocarbon years. This calibration is likely based on an out of date INTCAL curve.';
COMMENT ON COLUMN ap.icesheets.symb IS 'Intended as a symbology for layers, all layers in this table have the value ICE.';
COMMENT ON COLUMN ap.icesheets.calage IS 'Layer age in calibrated radiocarbon years. This calibration is likely based on an out of date INTCAL curve. Just cal x 1000';

--- Table indices
CREATE UNIQUE INDEX icesheets_pkey ON ap.icesheets USING btree (gid);
CREATE INDEX icesheets_geom_idx ON ap.icesheets USING gist (geom)

--- Remove existing constraints if needed
-- ALTER TABLE ap.icesheets DROP CONSTRAINT IF EXISTS icesheets_pkey;

--- Non-foreign key constraints
ALTER TABLE ap.icesheets ADD CONSTRAINT icesheets_pkey PRIMARY KEY (gid);

--- Foreign Key Restraints

--- Triggers