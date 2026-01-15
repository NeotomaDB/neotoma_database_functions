-- radiocarbonmethods definition

-- Drop table

-- DROP TABLE IF EXISTS radiocarbonmethods.radiocarbonmethods

CREATE TABLE radiocarbonmethods.radiocarbonmethods (
    radiocarbonmethodid integer DEFAULT nextval('ndb.seq_radiocarbonmethods_radiocarbonmethodid'::regclass) NOT NULL,
    radiocarbonmethod character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT radiocarbonmethods_pkey PRIMARY KEY (radiocarbonmethodid)
);


-- adempiere.wmv_ghgaudit foreign keys

;