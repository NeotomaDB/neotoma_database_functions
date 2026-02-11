-- ndb.faciestypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.faciestypes

CREATE TABLE IF NOT EXISTS ndb.faciestypes (

    faciesid integer DEFAULT nextval('ndb.seq_faciestypes_faciesid'::regclass) NOT NULL,
    facies character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.faciestypes IS "Lookup table of Facies Types. Table is referenced by the AnalysisUnits table.";

--- Table indices
CREATE UNIQUE INDEX faciestypes_pkey ON ndb.faciestypes USING btree (faciesid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.faciestypes DROP CONSTRAINT IF EXISTS faciestypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.faciestypes ADD CONSTRAINT faciestypes_pkey PRIMARY KEY (faciesid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.faciestypes;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.faciestypes;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.faciestypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.faciestypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();