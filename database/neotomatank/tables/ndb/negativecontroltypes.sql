-- ndb.negativecontroltypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.negativecontroltypes

CREATE TABLE IF NOT EXISTS ndb.negativecontroltypes (

    negativecontroltypeid integer DEFAULT nextval('ndb.negativecontroltypes_negativecontroltypeid_seq'::regclass) NOT NULL,
    negativecontroltype text NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.negativecontroltypes IS "";

--- Table indices
CREATE UNIQUE INDEX negativecontroltypes_pkey ON ndb.negativecontroltypes USING btree (negativecontroltypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.negativecontroltypes DROP CONSTRAINT IF EXISTS negativecontroltypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.negativecontroltypes ADD CONSTRAINT negativecontroltypes_pkey PRIMARY KEY (negativecontroltypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_ncontrols_createdate ON ndb.negativecontroltypes;
-- DROP TRIGGER IF EXISTS tr_ncontrols_modifydate ON ndb.negativecontroltypes;
-- DROP TRIGGER IF EXISTS tr_ncontrols_modifydate ON ndb.negativecontroltypes;
CREATE TRIGGER tr_ncontrols_createdate BEFORE INSERT ON ndb.negativecontroltypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();
CREATE TRIGGER tr_ncontrols_modifydate BEFORE INSERT ON ndb.negativecontroltypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_ncontrols_modifydate BEFORE UPDATE ON ndb.negativecontroltypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();