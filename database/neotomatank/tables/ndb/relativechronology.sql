-- ndb.relativechronology Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.relativechronology

CREATE TABLE IF NOT EXISTS ndb.relativechronology (

    relativechronid integer DEFAULT nextval('ndb.seq_relativechronology_relativechronid'::regclass) NOT NULL,
    analysisunitid integer NOT NULL,
    relativeageid integer NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    chroncontrolid integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.relativechronology IS 'This table stores relative chronologic data. Relative Ages are assigned to Analysis Units, The Relative Age data along with any possible Geochronology and Tephrachronology data are used to create a chronology.';
COMMENT ON COLUMN ndb.relativechronology.relativechronid IS 'An arbitrary Relative Chronology identification number.';
COMMENT ON COLUMN ndb.relativechronology.analysisunitid IS 'Analysis Unit identification number. Field links to the AnalysisUnits table.';
COMMENT ON COLUMN ndb.relativechronology.relativeageid IS 'Relative Age identification number. Field links to the RelativeAges lookup table.';
COMMENT ON COLUMN ndb.relativechronology.notes IS 'Free form notes or comments.';
COMMENT ON COLUMN ndb.relativechronology.recdatecreated IS '';
COMMENT ON COLUMN ndb.relativechronology.recdatemodified IS '';
COMMENT ON COLUMN ndb.relativechronology.chroncontrolid IS '';

--- Table indices
CREATE UNIQUE INDEX relativechronology_pkey ON ndb.relativechronology USING btree (relativechronid);
CREATE INDEX ix_analysisunitid_relativechronology ON ndb.relativechronology USING btree (analysisunitid) WITH (fillfactor='10');
CREATE INDEX ix_relativeageid_relativechronology ON ndb.relativechronology USING btree (relativeageid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.relativechronology DROP CONSTRAINT IF EXISTS relativechronology_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.relativechronology ADD CONSTRAINT relativechronology_pkey PRIMARY KEY (relativechronid);

--- Foreign Key Restraints
ALTER TABLE ndb.relativechronology ADD CONSTRAINT fk_relativechronology_relativeages FOREIGN KEY (relativeageid) REFERENCES ndb.relativeages(relativeageid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.relativechronology ADD CONSTRAINT fk_relativechronology_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.relativechronology ADD CONSTRAINT rc_ccid FOREIGN KEY (chroncontrolid) REFERENCES ndb.chroncontrols(chroncontrolid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.relativechronology;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.relativechronology;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.relativechronology FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.relativechronology FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n