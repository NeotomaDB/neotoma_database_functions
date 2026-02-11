-- ndb.taxagrouptypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.taxagrouptypes

CREATE TABLE IF NOT EXISTS ndb.taxagrouptypes (

    taxagroupid character varying(3) NOT NULL,
    taxagroup character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.taxagrouptypes IS "Lookup table for Taxa Group Types. This table is referenced by the Taxa table.";

--- Table indices
CREATE UNIQUE INDEX taxagrouptypes_pkey ON ndb.taxagrouptypes USING btree (taxagroupid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.taxagrouptypes DROP CONSTRAINT IF EXISTS taxagrouptypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.taxagrouptypes ADD CONSTRAINT taxagrouptypes_pkey PRIMARY KEY (taxagroupid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.taxagrouptypes;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.taxagrouptypes;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.taxagrouptypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.taxagrouptypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();