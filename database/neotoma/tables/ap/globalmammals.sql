-- ap definition

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


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ap.globalmammals IS "";

--- Table indices
CREATE UNIQUE INDEX globalmammals_pkey ON ap.globalmammals USING btree (fid);
CREATE INDEX globalmammals_geom_geom_idx ON ap.globalmammals USING gist (geom)

--- Remove existing constraints if needed
ALTER TABLE ap.globalmammals DROP CONSTRAINT IF EXISTS globalmammals_pkey;

--- Non-foreign key constraints
ALTER TABLE ap.globalmammals ADD CONSTRAINT globalmammals_pkey PRIMARY KEY (fid);

--- Foreign Key Restraints