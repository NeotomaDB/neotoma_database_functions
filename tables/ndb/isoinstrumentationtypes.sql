-- isoinstrumentationtypes definition

-- Drop table

-- DROP TABLE IF EXISTS isoinstrumentationtypes.isoinstrumentationtypes

CREATE TABLE isoinstrumentationtypes.isoinstrumentationtypes (
    isoinstrumentationtypeid integer DEFAULT nextval('ndb.seq_isoinstrumentationtypes_isoinstrumentationtypeid'::regclass) NOT NULL,
    isoinstrumentationtype character varying(256) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isoinstrumentationtypes_pkey PRIMARY KEY (isoinstrumentationtypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;