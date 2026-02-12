-- ndb.isosampleorigintypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isosampleorigintypes

CREATE TABLE IF NOT EXISTS ndb.isosampleorigintypes (

    isosampleorigintypeid integer DEFAULT nextval('ndb.seq_isosampleorigintypes_isosampleorigintypeid'::regclass) NOT NULL,
    isosampleorigintype character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.isosampleorigintypes IS '';
COMMENT ON COLUMN ndb.isosampleorigintypes.isosampleorigintypeid IS '';
COMMENT ON COLUMN ndb.isosampleorigintypes.isosampleorigintype IS '';
COMMENT ON COLUMN ndb.isosampleorigintypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.isosampleorigintypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX isosampleorigintypes_pkey ON ndb.isosampleorigintypes USING btree (isosampleorigintypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.isosampleorigintypes DROP CONSTRAINT IF EXISTS isosampleorigintypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isosampleorigintypes ADD CONSTRAINT isosampleorigintypes_pkey PRIMARY KEY (isosampleorigintypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isosampleorigintypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isosampleorigintypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.isosampleorigintypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.isosampleorigintypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n