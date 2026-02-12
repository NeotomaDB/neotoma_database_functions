-- ndb.collectiontypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.collectiontypes

CREATE TABLE IF NOT EXISTS ndb.collectiontypes (

    colltypeid integer DEFAULT nextval('ndb.seq_collectiontypes_colltypeid'::regclass) NOT NULL,
    colltype character varying(64) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.collectiontypes IS 'This table is a lookup table for types of Collection Units, or Collection Types. Table is referenced by the CollectionUnits table.';
COMMENT ON COLUMN ndb.collectiontypes.colltypeid IS 'An arbitrary Collection Type identification number.';
COMMENT ON COLUMN ndb.collectiontypes.colltype IS 'The Collection Type. Types include cores, sections, excavations, and animal middens. Collection Units may be modern collections, surface float, or isolated specimens. Composite Collections Units include different kinds of Analysis Units, for example a modern surface sample for ostracodes and an associated water sample.';
COMMENT ON COLUMN ndb.collectiontypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.collectiontypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX collectiontypes_pkey ON ndb.collectiontypes USING btree (colltypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.collectiontypes DROP CONSTRAINT IF EXISTS collectiontypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.collectiontypes ADD CONSTRAINT collectiontypes_pkey PRIMARY KEY (colltypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.collectiontypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.collectiontypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.collectiontypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.collectiontypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n