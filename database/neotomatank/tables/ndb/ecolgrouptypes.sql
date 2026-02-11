-- ndb.ecolgrouptypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.ecolgrouptypes

CREATE TABLE IF NOT EXISTS ndb.ecolgrouptypes (

    ecolgroupid character varying(4) NOT NULL,
    ecolgroup character varying(64) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.ecolgrouptypes IS "Lookup table of Ecological Group Types. Table is referenced by the EcolGroups table.";

--- Table indices
CREATE UNIQUE INDEX ecolgrouptypes_pkey ON ndb.ecolgrouptypes USING btree (ecolgroupid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.ecolgrouptypes DROP CONSTRAINT IF EXISTS ecolgrouptypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.ecolgrouptypes ADD CONSTRAINT ecolgrouptypes_pkey PRIMARY KEY (ecolgroupid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.ecolgrouptypes;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.ecolgrouptypes;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.ecolgrouptypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.ecolgrouptypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();