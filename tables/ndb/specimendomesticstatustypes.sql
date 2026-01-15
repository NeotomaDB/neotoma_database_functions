-- specimendomesticstatustypes definition

-- Drop table

-- DROP TABLE IF EXISTS specimendomesticstatustypes.specimendomesticstatustypes

CREATE TABLE specimendomesticstatustypes.specimendomesticstatustypes (
    domesticstatusid integer DEFAULT nextval('ndb.seq_specimendomesticstatustypes_domesticstatusid'::regclass) NOT NULL,
    domesticstatus character varying(24) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT specimendomesticstatustypes_pkey PRIMARY KEY (domesticstatusid)
);


-- adempiere.wmv_ghgaudit foreign keys

;