-- ndb.datasettypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasettypes

CREATE TABLE IF NOT EXISTS ndb.datasettypes (

    datasettypeid integer DEFAULT nextval('ndb.seq_datasettypes_datasettypeid'::regclass) NOT NULL,
    datasettype character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.datasettypes IS 'Lookup table for Dataset Types. Table is referenced by the Datasets table.';
COMMENT ON COLUMN ndb.datasettypes.datasettypeid IS 'An arbitrary Dataset Type identification number.';
COMMENT ON COLUMN ndb.datasettypes.datasettype IS 'The Dataset type, including the following:
geochronologic
loss-on-ignition
pollen
plant macrofossils
vertebrate fauna
mollusks';
COMMENT ON COLUMN ndb.datasettypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.datasettypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX datasettypes_pkey ON ndb.datasettypes USING btree (datasettypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.datasettypes DROP CONSTRAINT IF EXISTS datasettypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datasettypes ADD CONSTRAINT datasettypes_pkey PRIMARY KEY (datasettypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasettypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasettypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.datasettypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.datasettypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n