-- relativeageunits definition

-- Drop table

-- DROP TABLE IF EXISTS relativeageunits.relativeageunits

CREATE TABLE relativeageunits.relativeageunits (
    relativeageunitid integer DEFAULT nextval('ndb.seq_relativeageunits_relativeageunitid'::regclass) NOT NULL,
    relativeageunit character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT relativeageunits_pkey PRIMARY KEY (relativeageunitid)
);


-- adempiere.wmv_ghgaudit foreign keys

;