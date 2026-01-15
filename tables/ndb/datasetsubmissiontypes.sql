-- datasetsubmissiontypes definition

-- Drop table

-- DROP TABLE IF EXISTS datasetsubmissiontypes.datasetsubmissiontypes

CREATE TABLE datasetsubmissiontypes.datasetsubmissiontypes (
    submissiontypeid integer DEFAULT nextval('ndb.seq_datasetsubmissiontypes_submissiontypeid'::regclass) NOT NULL,
    submissiontype character varying(80) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT datasetsubmissiontypes_pkey PRIMARY KEY (submissiontypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;