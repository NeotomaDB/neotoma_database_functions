-- variableunits definition

-- Drop table

-- DROP TABLE IF EXISTS variableunits.variableunits

CREATE TABLE variableunits.variableunits (
    variableunitsid integer DEFAULT nextval('ndb.seq_variableunits_variableunitsid'::regclass) NOT NULL,
    variableunits character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT variableunits_pkey PRIMARY KEY (variableunitsid)
);


-- adempiere.wmv_ghgaudit foreign keys

;