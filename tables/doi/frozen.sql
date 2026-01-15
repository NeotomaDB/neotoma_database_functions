-- frozen definition

-- Drop table

-- DROP TABLE IF EXISTS frozen.frozen

CREATE TABLE frozen.frozen (
    datasetid integer NULL,
    download jsonb NOT NULL,
    recdatecreated timestamp(6) without time zone DEFAULT now() NULL,
    recmodified timestamp(6) without time zone DEFAULT now() NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

;