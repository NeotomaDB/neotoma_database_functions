-- ndb.spatialreferencesystems Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.spatialreferencesystems

CREATE TABLE IF NOT EXISTS ndb.spatialreferencesystems (

    spatialreferencesystemid integer DEFAULT nextval('ndb.spatialreferencesystems_spatialreferencesystemid_seq'::regclass) NOT NULL,
    spatialreferencesystem text NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.spatialreferencesystems IS "";

--- Table indices
CREATE UNIQUE INDEX spatialreferencesystems_pkey ON ndb.spatialreferencesystems USING btree (spatialreferencesystemid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.spatialreferencesystems DROP CONSTRAINT IF EXISTS spatialreferencesystems_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.spatialreferencesystems ADD CONSTRAINT spatialreferencesystems_pkey PRIMARY KEY (spatialreferencesystemid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_spatialreferencesystems_createdate ON ndb.spatialreferencesystems;
-- DROP TRIGGER IF EXISTS tr_spatialreferencesystems_modifydate ON ndb.spatialreferencesystems;
-- DROP TRIGGER IF EXISTS tr_spatialreferencesystems_modifydate ON ndb.spatialreferencesystems;
CREATE TRIGGER tr_spatialreferencesystems_createdate BEFORE INSERT ON ndb.spatialreferencesystems FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();
CREATE TRIGGER tr_spatialreferencesystems_modifydate BEFORE INSERT ON ndb.spatialreferencesystems FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_spatialreferencesystems_modifydate BEFORE UPDATE ON ndb.spatialreferencesystems FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();