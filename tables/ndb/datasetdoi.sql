-- datasetdoi definition

-- Drop table

-- DROP TABLE IF EXISTS datasetdoi.datasetdoi

CREATE TABLE datasetdoi.datasetdoi (
    datasetid integer NOT NULL,
    doi character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    published boolean DEFAULT true NOT NULL,
    CONSTRAINT datasetdoi_pkey PRIMARY KEY (datasetid, doi)
);


-- adempiere.wmv_ghgaudit foreign keys

;