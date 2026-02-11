-- ndb.samplecategories Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.samplecategories

CREATE TABLE IF NOT EXISTS ndb.samplecategories (

    samplecategoryid integer DEFAULT nextval('ndb.samplecategories_samplecategoryid_seq'::regclass) NOT NULL,
    samplecategory text NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.samplecategories IS "";

--- Table indices
CREATE UNIQUE INDEX samplecategories_pkey ON ndb.samplecategories USING btree (samplecategoryid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.samplecategories DROP CONSTRAINT IF EXISTS samplecategories_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.samplecategories ADD CONSTRAINT samplecategories_pkey PRIMARY KEY (samplecategoryid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_samplecategories_createdate ON ndb.samplecategories;
-- DROP TRIGGER IF EXISTS tr_samplecategories_modifydate ON ndb.samplecategories;
-- DROP TRIGGER IF EXISTS tr_samplecategories_modifydate ON ndb.samplecategories;
CREATE TRIGGER tr_samplecategories_createdate BEFORE INSERT ON ndb.samplecategories FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();
CREATE TRIGGER tr_samplecategories_modifydate BEFORE INSERT ON ndb.samplecategories FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_samplecategories_modifydate BEFORE UPDATE ON ndb.samplecategories FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();