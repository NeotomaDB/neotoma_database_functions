-- fractiondated definition

-- Drop table

-- DROP TABLE IF EXISTS fractiondated.fractiondated

CREATE TABLE fractiondated.fractiondated (
    fractionid integer DEFAULT nextval('ndb.seq_fractiondated_fractionid'::regclass) NOT NULL,
    fraction character varying(80) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT fractiondated_pkey PRIMARY KEY (fractionid)
);


-- adempiere.wmv_ghgaudit foreign keys

;