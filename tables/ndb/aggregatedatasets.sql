-- aggregatedatasets definition

-- Drop table

-- DROP TABLE IF EXISTS aggregatedatasets.aggregatedatasets

CREATE TABLE aggregatedatasets.aggregatedatasets (
    aggregatedatasetid integer DEFAULT nextval('ndb.seq_aggregatedatasets_aggregatedatasetid'::regclass) NOT NULL,
    aggregatedatasetname character varying(255) NOT NULL,
    aggregateordertypeid integer NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT aggregatedatasets_pkey PRIMARY KEY (aggregatedatasetid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.aggregatedatasets ADD CONSTRAINT fk_aggregatedatasets_aggregateordertypes FOREIGN KEY (aggregateordertypeid) REFERENCES ndb.aggregateordertypes(aggregateordertypeid) ON UPDATE CASCADE ON DELETE CASCADE;