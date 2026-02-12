-- ndb.variables Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.variables

CREATE TABLE IF NOT EXISTS ndb.variables (

    variableid integer DEFAULT nextval('ndb.seq_variables_variableid'::regclass) NOT NULL,
    taxonid integer NOT NULL,
    variableelementid integer NULL,
    variableunitsid integer NULL,
    variablecontextid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.variables IS 'This table lists Variables, which always consist of a Taxon and Units of measurement. Variables can also have Elements, Contexts, and Modifications. Thus, the same taxon with different measurement units (e.g. present/absent, NISP, MNI) are different Variables.';
COMMENT ON COLUMN ndb.variables.variableid IS 'An arbitrary Variable identification number.';
COMMENT ON COLUMN ndb.variables.taxonid IS 'Taxon identification number. Field links to the Taxa table.';
COMMENT ON COLUMN ndb.variables.variableelementid IS 'Variable Element identification number. Field links to the VariableElements lookup table.';
COMMENT ON COLUMN ndb.variables.variableunitsid IS 'Variable Units identification number. Field links to the VariableUnits lookup table.';
COMMENT ON COLUMN ndb.variables.variablecontextid IS 'Variable Context identification number. Field links to the VariableContexts lookup table.';
COMMENT ON COLUMN ndb.variables.recdatecreated IS '';
COMMENT ON COLUMN ndb.variables.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX variables_pkey ON ndb.variables USING btree (variableid);
CREATE INDEX ix_taxonid_variables ON ndb.variables USING btree (taxonid) WITH (fillfactor='10');
CREATE INDEX variableel ON ndb.variables USING btree (taxonid, variableelementid, variableunitsid);
CREATE UNIQUE INDEX variables_unique ON ndb.variables USING btree (taxonid, variableelementid, variableunitsid, variablecontextid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.variables DROP CONSTRAINT IF EXISTS variables_pkey;
-- ALTER TABLE ndb.variables DROP CONSTRAINT IF EXISTS variables_unique;

--- Non-foreign key constraints
ALTER TABLE ndb.variables ADD CONSTRAINT variables_pkey PRIMARY KEY (variableid);
ALTER TABLE ndb.variables ADD CONSTRAINT variables_unique UNIQUE (taxonid, variableelementid, variableunitsid, variablecontextid);

--- Foreign Key Restraints
ALTER TABLE ndb.variables ADD CONSTRAINT fk_variables_variablecontexts FOREIGN KEY (variablecontextid) REFERENCES ndb.variablecontexts(variablecontextid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.variables ADD CONSTRAINT fk_variables_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.variables ADD CONSTRAINT fk_variables_variableunits FOREIGN KEY (variableunitsid) REFERENCES ndb.variableunits(variableunitsid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.variables ADD CONSTRAINT fk_variables_variableelements FOREIGN KEY (variableelementid) REFERENCES ndb.variableelements(variableelementid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.variables;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.variables;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.variables FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.variables FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n