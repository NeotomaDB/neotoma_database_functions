-- ap.faunranges Table definition

-- Drop table

-- DROP TABLE IF EXISTS ap.faunranges

CREATE TABLE IF NOT EXISTS ap.faunranges (

    gid integer DEFAULT nextval('ap.faunranges_gid_seq'::regclass) NOT NULL,
    spid character varying(10) NULL,
    sciname character varying(254) NULL,
    the_geom geometry(MultiPolygon,4326) NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ap.faunranges IS "";

--- Table indices
CREATE UNIQUE INDEX faunranges_pkey ON ap.faunranges USING btree (gid);
CREATE INDEX geom_idx ON ap.faunranges USING gist (the_geom);
CREATE INDEX sciname_idx ON ap.faunranges USING btree (sciname)

--- Remove existing constraints if needed
-- ALTER TABLE ap.faunranges DROP CONSTRAINT IF EXISTS faunranges_pkey;

--- Non-foreign key constraints
ALTER TABLE ap.faunranges ADD CONSTRAINT faunranges_pkey PRIMARY KEY (gid);

--- Foreign Key Restraints

--- Triggers