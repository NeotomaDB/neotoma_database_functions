-- ndb.isostandardtypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isostandardtypes

CREATE TABLE IF NOT EXISTS ndb.isostandardtypes (

    isostandardtypeid integer DEFAULT nextval('ndb.seq_isostandardtypes_isostandardtypeid'::regclass) NOT NULL,
    isostandardtype character varying(128) NOT NULL,
    isostandardmaterial character varying(128) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.isostandardtypes IS '';
COMMENT ON COLUMN ndb.isostandardtypes.isostandardtypeid IS '';
COMMENT ON COLUMN ndb.isostandardtypes.isostandardtype IS '';
COMMENT ON COLUMN ndb.isostandardtypes.isostandardmaterial IS '';
COMMENT ON COLUMN ndb.isostandardtypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.isostandardtypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX isostandardtypes_pkey ON ndb.isostandardtypes USING btree (isostandardtypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.isostandardtypes DROP CONSTRAINT IF EXISTS isostandardtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isostandardtypes ADD CONSTRAINT isostandardtypes_pkey PRIMARY KEY (isostandardtypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isostandardtypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isostandardtypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.isostandardtypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.isostandardtypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n