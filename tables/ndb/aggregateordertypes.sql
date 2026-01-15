-- aggregateordertypes definition

-- Drop table

-- DROP TABLE IF EXISTS aggregateordertypes.aggregateordertypes

CREATE TABLE aggregateordertypes.aggregateordertypes (
    aggregateordertypeid integer DEFAULT nextval('ndb.seq_aggregateordertypes_aggregateordertypeid'::regclass) NOT NULL,
    aggregateordertype character varying(64) NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT aggregateordertypes_pkey PRIMARY KEY (aggregateordertypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;