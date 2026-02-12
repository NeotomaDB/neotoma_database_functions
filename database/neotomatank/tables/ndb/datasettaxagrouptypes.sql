-- ndb.datasettaxagrouptypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasettaxagrouptypes

CREATE TABLE IF NOT EXISTS ndb.datasettaxagrouptypes (

    datasettypeid integer NOT NULL,
    taxagroupid character varying(3) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.datasettaxagrouptypes IS '';
COMMENT ON COLUMN ndb.datasettaxagrouptypes.datasettypeid IS '';
COMMENT ON COLUMN ndb.datasettaxagrouptypes.taxagroupid IS '';
COMMENT ON COLUMN ndb.datasettaxagrouptypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.datasettaxagrouptypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX datasettaxagrouptypes_pkey ON ndb.datasettaxagrouptypes USING btree (datasettypeid, taxagroupid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.datasettaxagrouptypes DROP CONSTRAINT IF EXISTS datasettaxagrouptypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datasettaxagrouptypes ADD CONSTRAINT datasettaxagrouptypes_pkey PRIMARY KEY (datasettypeid, taxagroupid);

--- Foreign Key Restraints
ALTER TABLE ndb.datasettaxagrouptypes ADD CONSTRAINT fk_datasettaxagrouptypes_taxagrouptypes FOREIGN KEY (taxagroupid) REFERENCES ndb.taxagrouptypes(taxagroupid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasettaxagrouptypes ADD CONSTRAINT fk_datasettaxagrouptypes_datasettypes FOREIGN KEY (datasettypeid) REFERENCES ndb.datasettypes(datasettypeid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasettaxagrouptypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasettaxagrouptypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.datasettaxagrouptypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.datasettaxagrouptypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n