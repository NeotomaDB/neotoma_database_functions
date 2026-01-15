-- aggregatechronologies definition

-- Drop table

-- DROP TABLE IF EXISTS aggregatechronologies.aggregatechronologies

CREATE TABLE aggregatechronologies.aggregatechronologies (
    aggregatechronid integer DEFAULT nextval('ndb.seq_aggregatechronologies_aggregatechronid'::regclass) NOT NULL,
    aggregatedatasetid integer NOT NULL,
    agetypeid integer NOT NULL,
    isdefault boolean NOT NULL,
    chronologyname character varying(80) NULL,
    ageboundyounger integer NULL,
    ageboundolder integer NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT aggregatechronologies_pkey PRIMARY KEY (aggregatechronid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.aggregatechronologies ADD CONSTRAINT fk_aggregatechronologies_aggregatedatasets FOREIGN KEY (aggregatedatasetid) REFERENCES ndb.aggregatedatasets(aggregatedatasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.aggregatechronologies ADD CONSTRAINT fk_aggregatechronologies_agetypes FOREIGN KEY (agetypeid) REFERENCES ndb.agetypes(agetypeid) ON UPDATE CASCADE ON DELETE CASCADE;