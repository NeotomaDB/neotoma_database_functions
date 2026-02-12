-- ndb.externalgeochronology Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.externalgeochronology

CREATE TABLE IF NOT EXISTS ndb.externalgeochronology (

    geochronid integer NULL,
    extdatabaseid integer NULL,
    identifier text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.externalgeochronology IS '';
COMMENT ON COLUMN ndb.externalgeochronology.geochronid IS '';
COMMENT ON COLUMN ndb.externalgeochronology.extdatabaseid IS '';
COMMENT ON COLUMN ndb.externalgeochronology.identifier IS '';

--- Table indices
CREATE UNIQUE INDEX uniqueid ON ndb.externalgeochronology USING btree (geochronid, extdatabaseid, identifier)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.externalgeochronology DROP CONSTRAINT IF EXISTS uniqueid;

--- Non-foreign key constraints
ALTER TABLE ndb.externalgeochronology ADD CONSTRAINT uniqueid UNIQUE (geochronid, extdatabaseid, identifier);

--- Foreign Key Restraints
ALTER TABLE ndb.externalgeochronology ADD CONSTRAINT externalgeochronology_geochronid_fkey FOREIGN KEY (geochronid) REFERENCES ndb.geochronology(geochronid);
ALTER TABLE ndb.externalgeochronology ADD CONSTRAINT externalgeochronology_extdatabaseid_fkey FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid);

--- Triggers