-- taxagrouptypes definition

-- Drop table

-- DROP TABLE IF EXISTS taxagrouptypes.taxagrouptypes

CREATE TABLE taxagrouptypes.taxagrouptypes (
    taxagroupid character varying(3) NOT NULL,
    taxagroup character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT taxagrouptypes_pkey PRIMARY KEY (taxagroupid)
);


-- adempiere.wmv_ghgaudit foreign keys

;