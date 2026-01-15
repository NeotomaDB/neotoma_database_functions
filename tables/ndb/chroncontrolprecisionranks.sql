-- chroncontrolprecisionranks definition

-- Drop table

-- DROP TABLE IF EXISTS chroncontrolprecisionranks.chroncontrolprecisionranks

CREATE TABLE chroncontrolprecisionranks.chroncontrolprecisionranks (
    precisionrankid integer DEFAULT nextval('ndb.seq_chroncontrolprecisionranks_precisionrankid'::regclass) NOT NULL,
    precisionrank character varying(255) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT chroncontrolprecisionranks_pkey PRIMARY KEY (precisionrankid)
);


-- adempiere.wmv_ghgaudit foreign keys

;