-- ndb definition

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


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.variableelements IS "Lookup table of Variable Elements. Table is referenced by the Variables table.";

--- Table indices
CREATE UNIQUE INDEX variableelements_pkey ON ndb.variableelements USING btree (variableelementid)

--- Remove existing constraints if needed
ALTER TABLE ndb.variableelements DROP CONSTRAINT IF EXISTS variableelements_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.variableelements ADD CONSTRAINT variableelements_pkey PRIMARY KEY (variableelementid);

--- Foreign Key Restraints
ALTER TABLE ndb.variableelements ADD CONSTRAINT fk_variableelements_elementmaturities FOREIGN KEY (maturityid) REFERENCES ndb.elementmaturities(maturityid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.variableelements ADD CONSTRAINT fk_variableelements_elementtypes FOREIGN KEY (elementtypeid) REFERENCES ndb.elementtypes(elementtypeid);
ALTER TABLE ndb.variableelements ADD CONSTRAINT fk_variableelements_elementsymmetries FOREIGN KEY (symmetryid) REFERENCES ndb.elementsymmetries(symmetryid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.variableelements ADD CONSTRAINT fk_variableelements_elementportions FOREIGN KEY (portionid) REFERENCES ndb.elementportions(portionid) ON UPDATE CASCADE ON DELETE CASCADE;