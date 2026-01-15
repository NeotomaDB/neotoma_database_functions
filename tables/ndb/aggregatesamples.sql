-- aggregatesamples definition

-- Drop table

-- DROP TABLE IF EXISTS aggregatesamples.aggregatesamples

CREATE TABLE aggregatesamples.aggregatesamples (
    aggregatedatasetid integer NOT NULL,
    sampleid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT aggregatesamples_pkey PRIMARY KEY (aggregatedatasetid, sampleid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.aggregatesamples ADD CONSTRAINT fk_aggregatesamples_aggregatedatasets FOREIGN KEY (aggregatedatasetid) REFERENCES ndb.aggregatedatasets(aggregatedatasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.aggregatesamples ADD CONSTRAINT fk_aggregatesamples_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;