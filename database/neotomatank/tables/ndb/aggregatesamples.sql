-- ndb.aggregatesamples Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.aggregatesamples

CREATE TABLE IF NOT EXISTS ndb.aggregatesamples (

    aggregatedatasetid integer NOT NULL,
    sampleid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.aggregatesamples IS 'This table stores the samples in Aggregate Datasets.';
COMMENT ON COLUMN ndb.aggregatesamples.aggregatedatasetid IS 'An arbitrary Aggregate Dataset identification number. Field links to the AggregateDatasets table.
';
COMMENT ON COLUMN ndb.aggregatesamples.sampleid IS 'Sample ID number. Field links to the Samples table.';
COMMENT ON COLUMN ndb.aggregatesamples.recdatecreated IS '';
COMMENT ON COLUMN ndb.aggregatesamples.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX aggregatesamples_pkey ON ndb.aggregatesamples USING btree (aggregatedatasetid, sampleid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.aggregatesamples DROP CONSTRAINT IF EXISTS aggregatesamples_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.aggregatesamples ADD CONSTRAINT aggregatesamples_pkey PRIMARY KEY (aggregatedatasetid, sampleid);

--- Foreign Key Restraints
ALTER TABLE ndb.aggregatesamples ADD CONSTRAINT fk_aggregatesamples_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.aggregatesamples ADD CONSTRAINT fk_aggregatesamples_aggregatedatasets FOREIGN KEY (aggregatedatasetid) REFERENCES ndb.aggregatedatasets(aggregatedatasetid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.aggregatesamples;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.aggregatesamples;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.aggregatesamples FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.aggregatesamples FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n