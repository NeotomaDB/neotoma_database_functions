-- ecolsettypes definition

-- Drop table

-- DROP TABLE IF EXISTS ecolsettypes.ecolsettypes

CREATE TABLE ecolsettypes.ecolsettypes (
    ecolsetid integer DEFAULT nextval('ndb.seq_ecolsettypes_ecolsetid'::regclass) NOT NULL,
    ecolsetname character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT ecolsettypes_pkey PRIMARY KEY (ecolsetid)
);


-- adempiere.wmv_ghgaudit foreign keys

;