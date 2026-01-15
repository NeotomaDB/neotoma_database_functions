-- specimensextypes definition

-- Drop table

-- DROP TABLE IF EXISTS specimensextypes.specimensextypes

CREATE TABLE specimensextypes.specimensextypes (
    sexid integer DEFAULT nextval('ndb.seq_specimensextypes_sexid'::regclass) NOT NULL,
    sex character varying(24) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT specimensextypes_pkey PRIMARY KEY (sexid)
);


-- adempiere.wmv_ghgaudit foreign keys

;