-- aggregatesampleages definition

-- Drop table

-- DROP TABLE IF EXISTS aggregatesampleages.aggregatesampleages

CREATE TABLE aggregatesampleages.aggregatesampleages (
    aggregatedatasetid integer NOT NULL,
    aggregatechronid integer NOT NULL,
    sampleageid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT aggregatesampleages_pkey PRIMARY KEY (aggregatedatasetid, aggregatechronid, sampleageid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.aggregatesampleages ADD CONSTRAINT fk_aggregatesampleages_aggregatechronologies FOREIGN KEY (aggregatechronid) REFERENCES ndb.aggregatechronologies(aggregatechronid);
ALTER TABLE ndb.aggregatesampleages ADD CONSTRAINT fk_aggregatesampleages_sampleages FOREIGN KEY (sampleageid) REFERENCES ndb.sampleages(sampleageid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.aggregatesampleages ADD CONSTRAINT fk_aggregatesampleages_aggregatedatasets FOREIGN KEY (aggregatedatasetid) REFERENCES ndb.aggregatedatasets(aggregatedatasetid) ON UPDATE CASCADE ON DELETE CASCADE;