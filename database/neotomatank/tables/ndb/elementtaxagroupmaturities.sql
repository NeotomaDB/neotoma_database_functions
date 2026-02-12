-- ndb.elementtaxagroupmaturities Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.elementtaxagroupmaturities

CREATE TABLE IF NOT EXISTS ndb.elementtaxagroupmaturities (

    elementtaxagroupid integer NOT NULL,
    maturityid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.elementtaxagroupmaturities IS '';
COMMENT ON COLUMN ndb.elementtaxagroupmaturities.elementtaxagroupid IS '';
COMMENT ON COLUMN ndb.elementtaxagroupmaturities.maturityid IS '';
COMMENT ON COLUMN ndb.elementtaxagroupmaturities.recdatecreated IS '';
COMMENT ON COLUMN ndb.elementtaxagroupmaturities.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX elementtaxagroupmaturities_pkey ON ndb.elementtaxagroupmaturities USING btree (elementtaxagroupid, maturityid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.elementtaxagroupmaturities DROP CONSTRAINT IF EXISTS elementtaxagroupmaturities_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.elementtaxagroupmaturities ADD CONSTRAINT elementtaxagroupmaturities_pkey PRIMARY KEY (elementtaxagroupid, maturityid);

--- Foreign Key Restraints
ALTER TABLE ndb.elementtaxagroupmaturities ADD CONSTRAINT fk_elementtaxagroupmaturities_elementtaxagroup FOREIGN KEY (elementtaxagroupid) REFERENCES ndb.elementtaxagroups(elementtaxagroupid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.elementtaxagroupmaturities ADD CONSTRAINT fk_elementtaxagroupmaturities_elementmaturities FOREIGN KEY (maturityid) REFERENCES ndb.elementmaturities(maturityid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.elementtaxagroupmaturities;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.elementtaxagroupmaturities;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.elementtaxagroupmaturities FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.elementtaxagroupmaturities FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n