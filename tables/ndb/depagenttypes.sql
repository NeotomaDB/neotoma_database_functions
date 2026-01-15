-- depagenttypes definition

-- Drop table

-- DROP TABLE IF EXISTS depagenttypes.depagenttypes

CREATE TABLE depagenttypes.depagenttypes (
    depagentid integer DEFAULT nextval('ndb.seq_depagenttypes_depagentid'::regclass) NOT NULL,
    depagent character varying(64) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT depagenttypes_pkey PRIMARY KEY (depagentid)
);


-- adempiere.wmv_ghgaudit foreign keys

;