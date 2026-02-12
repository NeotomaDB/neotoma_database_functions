-- ndb.geopaths Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.geopaths

CREATE TABLE IF NOT EXISTS ndb.geopaths (

    geoout integer[] NOT NULL,
    geoin bigint NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.geopaths IS '';
COMMENT ON COLUMN ndb.geopaths.geoout IS '';
COMMENT ON COLUMN ndb.geopaths.geoin IS '';

--- Table indices
CREATE UNIQUE INDEX geopaths_pkey ON ndb.geopaths USING btree (geoout, geoin)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.geopaths DROP CONSTRAINT IF EXISTS geopaths_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.geopaths ADD CONSTRAINT geopaths_pkey PRIMARY KEY (geoout, geoin);

--- Foreign Key Restraints
ALTER TABLE ndb.geopaths ADD CONSTRAINT geopaths_geoin_fkey FOREIGN KEY (geoin) REFERENCES ndb.geopoliticalunits(geopoliticalid);

--- Triggers