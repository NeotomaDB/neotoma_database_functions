-- doimeta definition

-- Drop table

-- DROP TABLE IF EXISTS doimeta.doimeta

CREATE TABLE doimeta.doimeta (
    doi character varying NOT NULL,
    meta jsonb NULL,
    datasetid integer NULL,
    recdatecreated timestamp with time zone DEFAULT now() NOT NULL,
    recdatemodified timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT doimeta_pkey PRIMARY KEY (doi)
);


-- adempiere.wmv_ghgaudit foreign keys

;