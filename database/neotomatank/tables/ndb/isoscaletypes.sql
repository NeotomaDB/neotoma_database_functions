-- ndb.isoscaletypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isoscaletypes

CREATE TABLE IF NOT EXISTS ndb.isoscaletypes (

    isoscaletypeid integer DEFAULT nextval('ndb.seq_isoscaletypes_isoscaletypeid'::regclass) NOT NULL,
    isoscaleacronym character varying(24) NOT NULL,
    isoscalename character varying(80) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.isoscaletypes IS '';
COMMENT ON COLUMN ndb.isoscaletypes.isoscaletypeid IS '';
COMMENT ON COLUMN ndb.isoscaletypes.isoscaleacronym IS '';
COMMENT ON COLUMN ndb.isoscaletypes.isoscalename IS '';
COMMENT ON COLUMN ndb.isoscaletypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.isoscaletypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX isoscaletypes_pkey ON ndb.isoscaletypes USING btree (isoscaletypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.isoscaletypes DROP CONSTRAINT IF EXISTS isoscaletypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isoscaletypes ADD CONSTRAINT isoscaletypes_pkey PRIMARY KEY (isoscaletypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isoscaletypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isoscaletypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.isoscaletypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.isoscaletypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n