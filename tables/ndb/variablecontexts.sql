-- variablecontexts definition

-- Drop table

-- DROP TABLE IF EXISTS variablecontexts.variablecontexts

CREATE TABLE variablecontexts.variablecontexts (
    variablecontextid integer DEFAULT nextval('ndb.seq_variablecontexts_variablecontextid'::regclass) NOT NULL,
    variablecontext character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT variablecontexts_pkey PRIMARY KEY (variablecontextid)
);


-- adempiere.wmv_ghgaudit foreign keys

;