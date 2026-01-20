-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.aggregatesampleages

CREATE TABLE IF NOT EXISTS ndb.aggregatesampleages (

    aggregatedatasetid integer NOT NULL,
    aggregatechronid integer NOT NULL,
    sampleageid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.aggregatesampleages IS "This table stores the links to the ages of samples in an Aggregate Dataset. The table is necessary because samples may be from Collection Units with multiple chronologies, and this table stores the links to the sample ages desired for the Aggregate Dataset.";

--- Table indices
CREATE UNIQUE INDEX aggregatesampleages_pkey ON ndb.aggregatesampleages USING btree (aggregatedatasetid, aggregatechronid, sampleageid)

--- Remove existing constraints if needed
ALTER TABLE ndb.aggregatesampleages DROP CONSTRAINT IF EXISTS aggregatesampleages_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.aggregatesampleages ADD CONSTRAINT aggregatesampleages_pkey PRIMARY KEY (aggregatedatasetid, aggregatechronid, sampleageid);

--- Foreign Key Restraints
ALTER TABLE ndb.aggregatesampleages ADD CONSTRAINT fk_aggregatesampleages_aggregatechronologies FOREIGN KEY (aggregatechronid) REFERENCES ndb.aggregatechronologies(aggregatechronid);
ALTER TABLE ndb.aggregatesampleages ADD CONSTRAINT fk_aggregatesampleages_sampleages FOREIGN KEY (sampleageid) REFERENCES ndb.sampleages(sampleageid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.aggregatesampleages ADD CONSTRAINT fk_aggregatesampleages_aggregatedatasets FOREIGN KEY (aggregatedatasetid) REFERENCES ndb.aggregatedatasets(aggregatedatasetid) ON UPDATE CASCADE ON DELETE CASCADE;