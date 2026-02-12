-- ndb.aggregatesampleages Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.aggregatesampleages

CREATE TABLE IF NOT EXISTS ndb.aggregatesampleages (

    aggregatedatasetid integer NOT NULL,
    aggregatechronid integer NOT NULL,
    sampleageid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.aggregatesampleages IS 'This table stores the links to the ages of samples in an Aggregate Dataset. The table is necessary because samples may be from Collection Units with multiple chronologies, and this table stores the links to the sample ages desired for the Aggregate Dataset.';
COMMENT ON COLUMN ndb.aggregatesampleages.aggregatedatasetid IS 'Aggregate Dataset identification number. Field links to the AggregateDatasets table.';
COMMENT ON COLUMN ndb.aggregatesampleages.aggregatechronid IS 'Aggregate Chronology identification number Field links to the AggregateChronologies table.';
COMMENT ON COLUMN ndb.aggregatesampleages.sampleageid IS 'Sample Age ID number. Field links to the SampleAges table.';
COMMENT ON COLUMN ndb.aggregatesampleages.recdatecreated IS '';
COMMENT ON COLUMN ndb.aggregatesampleages.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX aggregatesampleages_pkey ON ndb.aggregatesampleages USING btree (aggregatedatasetid, aggregatechronid, sampleageid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.aggregatesampleages DROP CONSTRAINT IF EXISTS aggregatesampleages_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.aggregatesampleages ADD CONSTRAINT aggregatesampleages_pkey PRIMARY KEY (aggregatedatasetid, aggregatechronid, sampleageid);

--- Foreign Key Restraints
ALTER TABLE ndb.aggregatesampleages ADD CONSTRAINT fk_aggregatesampleages_sampleages FOREIGN KEY (sampleageid) REFERENCES ndb.sampleages(sampleageid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.aggregatesampleages ADD CONSTRAINT fk_aggregatesampleages_aggregatechronologies FOREIGN KEY (aggregatechronid) REFERENCES ndb.aggregatechronologies(aggregatechronid);
ALTER TABLE ndb.aggregatesampleages ADD CONSTRAINT fk_aggregatesampleages_aggregatedatasets FOREIGN KEY (aggregatedatasetid) REFERENCES ndb.aggregatedatasets(aggregatedatasetid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.aggregatesampleages;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.aggregatesampleages;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.aggregatesampleages FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.aggregatesampleages FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n