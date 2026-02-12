-- ap.globalmammals Table definition

-- Drop table

-- DROP TABLE IF EXISTS ap.globalmammals

CREATE TABLE IF NOT EXISTS ap.globalmammals (

    fid integer DEFAULT nextval('ap.globalmammals_fid_seq'::regclass) NOT NULL,
    sciname character varying NULL,
    "order" character varying NULL,
    family character varying NULL,
    author character varying NULL,
    year double precision NULL,
    citation character varying NULL,
    rec_source character varying NULL,
    geom geometry(MultiPolygon,4326) NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ap.globalmammals IS '';
COMMENT ON COLUMN ap.globalmammals.fid IS '';
COMMENT ON COLUMN ap.globalmammals.sciname IS '';
COMMENT ON COLUMN ap.globalmammals."order" IS '';
COMMENT ON COLUMN ap.globalmammals.family IS '';
COMMENT ON COLUMN ap.globalmammals.author IS '';
COMMENT ON COLUMN ap.globalmammals.year IS '';
COMMENT ON COLUMN ap.globalmammals.citation IS '';
COMMENT ON COLUMN ap.globalmammals.rec_source IS '';
COMMENT ON COLUMN ap.globalmammals.geom IS '';

--- Table indices
CREATE UNIQUE INDEX globalmammals_pkey ON ap.globalmammals USING btree (fid);
CREATE INDEX globalmammals_geom_geom_idx ON ap.globalmammals USING gist (geom)

--- Remove existing constraints if needed
-- ALTER TABLE ap.globalmammals DROP CONSTRAINT IF EXISTS globalmammals_pkey;

--- Non-foreign key constraints
ALTER TABLE ap.globalmammals ADD CONSTRAINT globalmammals_pkey PRIMARY KEY (fid);

--- Foreign Key Restraints

--- Triggers