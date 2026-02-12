-- ndb.samples Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.samples

CREATE TABLE IF NOT EXISTS ndb.samples (

    sampleid integer DEFAULT nextval('ndb.seq_samples_sampleid'::regclass) NOT NULL,
    analysisunitid integer NOT NULL,
    datasetid integer NOT NULL,
    samplename character varying(80) NULL,
    analysisdate date NULL,
    labnumber character varying(40) NULL,
    preparationmethod text NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    sampledate date NULL,
    taxonid integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.samples IS 'This table stores sample data. Samples belong to Analysis Units, which belong to Collection Units, which belong to Sites. Samples also belong to a Dataset, and the Dataset determines the type of sample. Thus, there could be two different samples from the same Analysis Unit, one belonging to a pollen dataset, the other to a plant macrofossil dataset.';
COMMENT ON COLUMN ndb.samples.sampleid IS 'An arbitrary Sample identification number.';
COMMENT ON COLUMN ndb.samples.analysisunitid IS 'Analysis Unit identification number. Field links to the AnalysisUnits table.';
COMMENT ON COLUMN ndb.samples.datasetid IS 'Dataset identification number. Field links to the Datasets table.';
COMMENT ON COLUMN ndb.samples.samplename IS 'Sample name if any.';
COMMENT ON COLUMN ndb.samples.analysisdate IS 'Date of analysis.';
COMMENT ON COLUMN ndb.samples.labnumber IS 'Laboratory number for the sample. A special case regards geochronologic samples, for which the LabNumber is the number, if any, assigned by the submitter, not the number assigned by the radiocarbon laboratory, which is in the Geochronology table.';
COMMENT ON COLUMN ndb.samples.preparationmethod IS 'Description, notes, or comments on preparation methods. For faunal samples, notes on screening methods or screen size are stored here.';
COMMENT ON COLUMN ndb.samples.notes IS 'Free form note or comments about the sample.';
COMMENT ON COLUMN ndb.samples.recdatecreated IS '';
COMMENT ON COLUMN ndb.samples.recdatemodified IS '';
COMMENT ON COLUMN ndb.samples.sampledate IS '';
COMMENT ON COLUMN ndb.samples.taxonid IS '';

--- Table indices
CREATE UNIQUE INDEX samples_pkey ON ndb.samples USING btree (sampleid);
CREATE INDEX ix_analysisunitid_samples ON ndb.samples USING btree (analysisunitid) WITH (fillfactor='10');
CREATE INDEX ix_datasetid_samples ON ndb.samples USING btree (datasetid) WITH (fillfactor='10');
CREATE INDEX sample_taxon_idx ON ndb.samples USING btree (taxonid);
CREATE INDEX idx_samples_datasetid_sampleid ON ndb.samples USING btree (datasetid) INCLUDE (sampleid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.samples DROP CONSTRAINT IF EXISTS samples_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.samples ADD CONSTRAINT samples_pkey PRIMARY KEY (sampleid);

--- Foreign Key Restraints
ALTER TABLE ndb.samples ADD CONSTRAINT fk_samples_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid);
ALTER TABLE ndb.samples ADD CONSTRAINT fk_samples_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.samples ADD CONSTRAINT fk_samples_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.samples;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.samples;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.samples FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.samples FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n