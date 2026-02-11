-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.aggregatesamples

CREATE TABLE IF NOT EXISTS ndb.aggregatesamples (

    aggregatedatasetid integer NOT NULL,
    sampleid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.aggregatesamples IS "This table stores the samples in Aggregate Datasets.";

--- Table indices
CREATE UNIQUE INDEX aggregatesamples_pkey ON ndb.aggregatesamples USING btree (aggregatedatasetid, sampleid)

--- Remove existing constraints if needed
ALTER TABLE ndb.aggregatesamples DROP CONSTRAINT IF EXISTS aggregatesamples_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.aggregatesamples ADD CONSTRAINT aggregatesamples_pkey PRIMARY KEY (aggregatedatasetid, sampleid);

--- Foreign Key Restraints
ALTER TABLE ndb.aggregatesamples ADD CONSTRAINT fk_aggregatesamples_aggregatedatasets FOREIGN KEY (aggregatedatasetid) REFERENCES ndb.aggregatedatasets(aggregatedatasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.aggregatesamples ADD CONSTRAINT fk_aggregatesamples_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;