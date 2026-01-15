-- summaries definition

-- Drop table

-- DROP TABLE IF EXISTS summaries.summaries

CREATE TABLE summaries.summaries (
    dbdate date NOT NULL,
    sites bigint NULL,
    datasets bigint NULL,
    publications bigint NULL,
    observations bigint NULL,
    CONSTRAINT summaries_pkey PRIMARY KEY (dbdate)
);


-- adempiere.wmv_ghgaudit foreign keys

;