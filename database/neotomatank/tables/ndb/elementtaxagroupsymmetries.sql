-- ndb.elementtaxagroupsymmetries Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.elementtaxagroupsymmetries

CREATE TABLE IF NOT EXISTS ndb.elementtaxagroupsymmetries (

    elementtaxagroupid integer NOT NULL,
    symmetryid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.elementtaxagroupsymmetries IS '';
COMMENT ON COLUMN ndb.elementtaxagroupsymmetries.elementtaxagroupid IS '';
COMMENT ON COLUMN ndb.elementtaxagroupsymmetries.symmetryid IS '';
COMMENT ON COLUMN ndb.elementtaxagroupsymmetries.recdatecreated IS '';
COMMENT ON COLUMN ndb.elementtaxagroupsymmetries.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX elementtaxagroupsymmetries_pkey ON ndb.elementtaxagroupsymmetries USING btree (elementtaxagroupid, symmetryid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.elementtaxagroupsymmetries DROP CONSTRAINT IF EXISTS elementtaxagroupsymmetries_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.elementtaxagroupsymmetries ADD CONSTRAINT elementtaxagroupsymmetries_pkey PRIMARY KEY (elementtaxagroupid, symmetryid);

--- Foreign Key Restraints
ALTER TABLE ndb.elementtaxagroupsymmetries ADD CONSTRAINT fk_elementtaxagroupsymmetries_elementtaxagroups FOREIGN KEY (elementtaxagroupid) REFERENCES ndb.elementtaxagroups(elementtaxagroupid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.elementtaxagroupsymmetries ADD CONSTRAINT fk_elementtaxagroupsymmetries_elementsymmetries FOREIGN KEY (symmetryid) REFERENCES ndb.elementsymmetries(symmetryid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.elementtaxagroupsymmetries;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.elementtaxagroupsymmetries;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.elementtaxagroupsymmetries FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.elementtaxagroupsymmetries FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n