-- ndb.geochrontypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.geochrontypes

CREATE TABLE IF NOT EXISTS ndb.geochrontypes (

    geochrontypeid integer DEFAULT nextval('ndb.seq_geochrontypes_geochrontypeid'::regclass) NOT NULL,
    geochrontype character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.geochrontypes IS 'Lookup table for Geochronology Types. Table is referenced by the Geochronology table.';
COMMENT ON COLUMN ndb.geochrontypes.geochrontypeid IS 'Geochronology Type identification number.';
COMMENT ON COLUMN ndb.geochrontypes.geochrontype IS 'Type of Geochronologic measurement.';
COMMENT ON COLUMN ndb.geochrontypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.geochrontypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX geochrontypes_pkey ON ndb.geochrontypes USING btree (geochrontypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.geochrontypes DROP CONSTRAINT IF EXISTS geochrontypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.geochrontypes ADD CONSTRAINT geochrontypes_pkey PRIMARY KEY (geochrontypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.geochrontypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.geochrontypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.geochrontypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.geochrontypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n