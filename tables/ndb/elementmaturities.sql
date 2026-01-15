-- elementmaturities definition

-- Drop table

-- DROP TABLE IF EXISTS elementmaturities.elementmaturities

CREATE TABLE elementmaturities.elementmaturities (
    maturityid integer DEFAULT nextval('ndb.seq_elementmaturities_maturityid'::regclass) NOT NULL,
    maturity character varying(36) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT elementmaturities_pkey PRIMARY KEY (maturityid)
);


-- adempiere.wmv_ghgaudit foreign keys

;