-- chroncontrolaccuracyranks definition

-- Drop table

-- DROP TABLE IF EXISTS chroncontrolaccuracyranks.chroncontrolaccuracyranks

CREATE TABLE chroncontrolaccuracyranks.chroncontrolaccuracyranks (
    accuracyrankid integer DEFAULT nextval('ndb.seq_chroncontrolaccuracyranks_accuracyrankid'::regclass) NOT NULL,
    accuracyrank character varying(255) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT chroncontrolaccuracyranks_pkey PRIMARY KEY (accuracyrankid)
);


-- adempiere.wmv_ghgaudit foreign keys

;