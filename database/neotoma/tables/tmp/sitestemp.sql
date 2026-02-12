-- tmp.sitestemp Table definition

-- Drop table

-- DROP TABLE IF EXISTS tmp.sitestemp

CREATE TABLE IF NOT EXISTS tmp.sitestemp (

    siteid integer NOT NULL,
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
    geog text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE tmp.sitestemp IS '';
COMMENT ON COLUMN tmp.sitestemp.siteid IS '';
COMMENT ON COLUMN tmp.sitestemp.sitename IS '';
COMMENT ON COLUMN tmp.sitestemp.longitudeeast IS '';
COMMENT ON COLUMN tmp.sitestemp.latitudenorth IS '';
COMMENT ON COLUMN tmp.sitestemp.longitudewest IS '';
COMMENT ON COLUMN tmp.sitestemp.latitudesouth IS '';
COMMENT ON COLUMN tmp.sitestemp.altitude IS '';
COMMENT ON COLUMN tmp.sitestemp.area IS '';
COMMENT ON COLUMN tmp.sitestemp.sitedescription IS '';
COMMENT ON COLUMN tmp.sitestemp.notes IS '';
COMMENT ON COLUMN tmp.sitestemp.recdatecreated IS '';
COMMENT ON COLUMN tmp.sitestemp.recdatemodified IS '';
COMMENT ON COLUMN tmp.sitestemp.geog IS '';

--- Table indices
CREATE UNIQUE INDEX sitestemp_pkey ON tmp.sitestemp USING btree (siteid)

--- Remove existing constraints if needed
-- ALTER TABLE tmp.sitestemp DROP CONSTRAINT IF EXISTS sitestemp_pkey;

--- Non-foreign key constraints
ALTER TABLE tmp.sitestemp ADD CONSTRAINT sitestemp_pkey PRIMARY KEY (siteid);

--- Foreign Key Restraints

--- Triggers