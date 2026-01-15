-- isobiomarkertypes definition

-- Drop table

-- DROP TABLE IF EXISTS isobiomarkertypes.isobiomarkertypes

CREATE TABLE isobiomarkertypes.isobiomarkertypes (
    isobiomarkertypeid integer DEFAULT nextval('ndb.seq_isobiomarkertypes_isobiomarkertypeid'::regclass) NOT NULL,
    isobiomarkertype character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isobiomarkertypes_pkey PRIMARY KEY (isobiomarkertypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;