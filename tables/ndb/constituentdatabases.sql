-- constituentdatabases definition

-- Drop table

-- DROP TABLE IF EXISTS constituentdatabases.constituentdatabases

CREATE TABLE constituentdatabases.constituentdatabases (
    databaseid integer DEFAULT nextval('ndb.seq_constituentdatabases_databaseid'::regclass) NOT NULL,
    databasename character varying(80) NOT NULL,
    contactid integer NULL,
    url character varying(128) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    description text NULL,
    CONSTRAINT constituentdatabases_pkey PRIMARY KEY (databaseid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.constituentdatabases ADD CONSTRAINT fk_constituentdatabases_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);