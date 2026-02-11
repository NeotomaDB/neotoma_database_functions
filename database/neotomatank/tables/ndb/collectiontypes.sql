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
COMMENT ON TABLE ndb.collectiontypes IS "This table is a lookup table for types of Collection Units, or Collection Types. Table is referenced by the CollectionUnits table.";

--- Table indices
CREATE UNIQUE INDEX collectiontypes_pkey ON ndb.collectiontypes USING btree (colltypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.collectiontypes DROP CONSTRAINT IF EXISTS collectiontypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.collectiontypes ADD CONSTRAINT collectiontypes_pkey PRIMARY KEY (colltypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.collectiontypes;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.collectiontypes;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.collectiontypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.collectiontypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();