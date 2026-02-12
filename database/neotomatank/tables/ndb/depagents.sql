-- ndb.depagents Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.depagents

CREATE TABLE IF NOT EXISTS ndb.depagents (

    analysisunitid integer NOT NULL,
    depagentid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.depagents IS 'Deposition Agents for Analysis Units. Individual Analysis Units may be listed multiple times with different Deposition Agents.';
COMMENT ON COLUMN ndb.depagents.analysisunitid IS 'Analysis Unit identification number. Field links to AnalysisUnits table.';
COMMENT ON COLUMN ndb.depagents.depagentid IS 'Deposition Agent identification number. Field links to DepAgentTypes table.';
COMMENT ON COLUMN ndb.depagents.recdatecreated IS '';
COMMENT ON COLUMN ndb.depagents.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX depagents_pkey ON ndb.depagents USING btree (analysisunitid, depagentid);
CREATE INDEX ix_analysisunitid_depagents ON ndb.depagents USING btree (analysisunitid) WITH (fillfactor='10');
CREATE INDEX ix_depagentid_depagents ON ndb.depagents USING btree (depagentid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.depagents DROP CONSTRAINT IF EXISTS depagents_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.depagents ADD CONSTRAINT depagents_pkey PRIMARY KEY (analysisunitid, depagentid);

--- Foreign Key Restraints
ALTER TABLE ndb.depagents ADD CONSTRAINT fk_depagents_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.depagents ADD CONSTRAINT fk_depagents_depagenttypes FOREIGN KEY (depagentid) REFERENCES ndb.depagenttypes(depagentid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.depagents;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.depagents;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.depagents FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.depagents FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n