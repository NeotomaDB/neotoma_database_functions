-- isopretreatmenttypes definition

-- Drop table

-- DROP TABLE IF EXISTS isopretreatmenttypes.isopretreatmenttypes

CREATE TABLE isopretreatmenttypes.isopretreatmenttypes (
    isopretreatmenttypeid integer DEFAULT nextval('ndb.seq_isopretreatmenttypes_isopretreatmenttypeid'::regclass) NOT NULL,
    isopretreatmenttype character varying(50) NOT NULL,
    isopretreatmentqualifier character varying(50) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isopretreatmenttypes_pkey PRIMARY KEY (isopretreatmenttypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;