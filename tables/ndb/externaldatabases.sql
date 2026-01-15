-- externaldatabases definition

-- Drop table

-- DROP TABLE IF EXISTS externaldatabases.externaldatabases

CREATE TABLE externaldatabases.externaldatabases (
    extdatabaseid integer DEFAULT nextval('ndb.seq_externaldatabases_extdatabaseid'::regclass) NOT NULL,
    extdatabasename character varying(80) NOT NULL,
    url character varying(128) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    urlmask character varying(128) NULL,
    CONSTRAINT externaldatabases_pkey PRIMARY KEY (extdatabaseid)
);


-- adempiere.wmv_ghgaudit foreign keys

;