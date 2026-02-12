-- ndb.variableelements Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.variableelements

CREATE TABLE IF NOT EXISTS ndb.variableelements (

    variableelementid integer DEFAULT nextval('ndb.seq_variableelements_variableelementid'::regclass) NOT NULL,
    variableelement character varying(255) NULL,
    elementtypeid integer NULL,
    symmetryid integer NULL,
    portionid integer NULL,
    maturityid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.variableelements IS 'Lookup table of Variable Elements. Table is referenced by the Variables table.';
COMMENT ON COLUMN ndb.variableelements.variableelementid IS 'An arbitrary Variable Element identification number.';
COMMENT ON COLUMN ndb.variableelements.variableelement IS 'The element, part, or organ of the taxon identified. For plants, these include pollen, spores, and various macrofossil organs, such as «seed», «twig», «cone», and «cone bract». Thus, Betula pollen and Betula seeds are two different Variables. For mammals, Elements include the bone or tooth identified, e.g. «tibia». «tibia, distal, left», «M2, lower, left». Some more unusual elements are Neotoma fecal pellets and Erethizon dorsata quills. If no element is indicated for mammalian fauna, then the genric element «bone/tooth» is assigned. Elements were not assigned in FAUNMAP, so all Variables ingested from FAUNMAP were assigned the «bone/tooth» element. Physical Variables may also have elements. For example, the Loss-on-ignition Variables have «Loss-on-ignition» as a Taxon, and temperature of analysis as an element, e.g. «500°C», «900°C». Charcoal Variables have the size fragments as elements, e.g. «75-100 µm», «100-125 µm».';
COMMENT ON COLUMN ndb.variableelements.elementtypeid IS '';
COMMENT ON COLUMN ndb.variableelements.symmetryid IS '';
COMMENT ON COLUMN ndb.variableelements.portionid IS '';
COMMENT ON COLUMN ndb.variableelements.maturityid IS '';
COMMENT ON COLUMN ndb.variableelements.recdatecreated IS '';
COMMENT ON COLUMN ndb.variableelements.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX variableelements_pkey ON ndb.variableelements USING btree (variableelementid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.variableelements DROP CONSTRAINT IF EXISTS variableelements_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.variableelements ADD CONSTRAINT variableelements_pkey PRIMARY KEY (variableelementid);

--- Foreign Key Restraints
ALTER TABLE ndb.variableelements ADD CONSTRAINT fk_variableelements_elementmaturities FOREIGN KEY (maturityid) REFERENCES ndb.elementmaturities(maturityid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.variableelements ADD CONSTRAINT fk_variableelements_elementtypes FOREIGN KEY (elementtypeid) REFERENCES ndb.elementtypes(elementtypeid);
ALTER TABLE ndb.variableelements ADD CONSTRAINT fk_variableelements_elementsymmetries FOREIGN KEY (symmetryid) REFERENCES ndb.elementsymmetries(symmetryid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.variableelements ADD CONSTRAINT fk_variableelements_elementportions FOREIGN KEY (portionid) REFERENCES ndb.elementportions(portionid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.variableelements;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.variableelements;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.variableelements FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.variableelements FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n