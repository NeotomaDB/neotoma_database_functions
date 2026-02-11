-- ndb.institutions Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.institutions

CREATE TABLE IF NOT EXISTS ndb.institutions (

    institutionid text NOT NULL,
    institutionname text NULL,
    institutionlocation text NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL,
    institutionpath text[] NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.institutions IS "A table representing all institutions that are part of the RoR dataset at DOI: 10.5281/zenodo.6347574";

--- Table indices
CREATE UNIQUE INDEX institutions_pkey ON ndb.institutions USING btree (institutionid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.institutions DROP CONSTRAINT IF EXISTS institutions_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.institutions ADD CONSTRAINT institutions_pkey PRIMARY KEY (institutionid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_institutions_createdate ON ndb.institutions;
-- DROP TRIGGER IF EXISTS tr_institutions_modifydate ON ndb.institutions;
-- DROP TRIGGER IF EXISTS tr_institutions_modifydate ON ndb.institutions;
CREATE TRIGGER tr_institutions_createdate BEFORE INSERT ON ndb.institutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();
CREATE TRIGGER tr_institutions_modifydate BEFORE INSERT ON ndb.institutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_institutions_modifydate BEFORE UPDATE ON ndb.institutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();