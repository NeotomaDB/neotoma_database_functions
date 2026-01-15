-- ecolgrouptypes definition

-- Drop table

-- DROP TABLE IF EXISTS ecolgrouptypes.ecolgrouptypes

CREATE TABLE ecolgrouptypes.ecolgrouptypes (
    ecolgroupid character varying(4) NOT NULL,
    ecolgroup character varying(64) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT ecolgrouptypes_pkey PRIMARY KEY (ecolgroupid)
);


-- adempiere.wmv_ghgaudit foreign keys

;