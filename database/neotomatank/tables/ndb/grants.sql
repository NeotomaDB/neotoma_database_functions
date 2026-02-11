-- ndb.grants Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.grants

CREATE TABLE IF NOT EXISTS ndb.grants (

    grantid integer DEFAULT nextval('ndb.grants_grantid_seq'::regclass) NOT NULL,
    grantname text NULL,
    grantnumber text NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.grants IS "";

--- Table indices
CREATE UNIQUE INDEX grants_pkey ON ndb.grants USING btree (grantid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.grants DROP CONSTRAINT IF EXISTS grants_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.grants ADD CONSTRAINT grants_pkey PRIMARY KEY (grantid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_grants_createdate ON ndb.grants;
-- DROP TRIGGER IF EXISTS tr_grants_modifydate ON ndb.grants;
-- DROP TRIGGER IF EXISTS tr_grants_modifydate ON ndb.grants;
CREATE TRIGGER tr_grants_createdate BEFORE INSERT ON ndb.grants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatecreated();
CREATE TRIGGER tr_grants_modifydate BEFORE INSERT ON ndb.grants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_grants_modifydate BEFORE UPDATE ON ndb.grants FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();