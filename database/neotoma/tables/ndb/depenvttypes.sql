-- ndb.depenvttypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.depenvttypes

CREATE TABLE IF NOT EXISTS ndb.depenvttypes (

    depenvtid integer DEFAULT nextval('ndb.seq_depenvttypes_depenvtid'::regclass) NOT NULL,
    depenvt character varying(255) NOT NULL,
    depenvthigherid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.depenvttypes IS 'Lookup table of Depositional Environment Types. Table is referenced by the CollectionUnits table.';
COMMENT ON COLUMN ndb.depenvttypes.depenvtid IS 'An arbitrary Depositional Environment Type identification number.';
COMMENT ON COLUMN ndb.depenvttypes.depenvt IS 'Depositional Environment.';
COMMENT ON COLUMN ndb.depenvttypes.depenvthigherid IS 'The Depositional Environment Types are hierarchical. DepEnvtHigherID is the DepEnvtID of the higher ranked Depositional Environment. The following table gives some examples.';
COMMENT ON COLUMN ndb.depenvttypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.depenvttypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX depenvttypes_pkey ON ndb.depenvttypes USING btree (depenvtid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.depenvttypes DROP CONSTRAINT IF EXISTS depenvttypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.depenvttypes ADD CONSTRAINT depenvttypes_pkey PRIMARY KEY (depenvtid);

--- Foreign Key Restraints
ALTER TABLE ndb.depenvttypes ADD CONSTRAINT fk_depenvthigherid FOREIGN KEY (depenvthigherid) REFERENCES ndb.depenvttypes(depenvtid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.depenvttypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.depenvttypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.depenvttypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.depenvttypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n