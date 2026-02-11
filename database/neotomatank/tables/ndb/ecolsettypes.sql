-- ndb.ecolsettypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.ecolsettypes

CREATE TABLE IF NOT EXISTS ndb.ecolsettypes (

    ecolsetid integer DEFAULT nextval('ndb.seq_ecolsettypes_ecolsetid'::regclass) NOT NULL,
    ecolsetname character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.ecolsettypes IS "Lookup table of Ecological Set Types. Table is referenced by the EcolGroups table.";

--- Table indices
CREATE UNIQUE INDEX ecolsettypes_pkey ON ndb.ecolsettypes USING btree (ecolsetid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.ecolsettypes DROP CONSTRAINT IF EXISTS ecolsettypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.ecolsettypes ADD CONSTRAINT ecolsettypes_pkey PRIMARY KEY (ecolsetid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.ecolsettypes;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.ecolsettypes;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.ecolsettypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.ecolsettypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();