-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.constituentdatabases

CREATE TABLE IF NOT EXISTS ndb.constituentdatabases (

    databaseid integer DEFAULT nextval('ndb.seq_constituentdatabases_databaseid'::regclass) NOT NULL,
    databasename character varying(80) NOT NULL,
    contactid integer NULL,
    url character varying(128) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    description text NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.constituentdatabases IS "";

--- Table indices
CREATE UNIQUE INDEX constituentdatabases_pkey ON ndb.constituentdatabases USING btree (databaseid)

--- Remove existing constraints if needed
ALTER TABLE ndb.constituentdatabases DROP CONSTRAINT IF EXISTS constituentdatabases_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.constituentdatabases ADD CONSTRAINT constituentdatabases_pkey PRIMARY KEY (databaseid);

--- Foreign Key Restraints
ALTER TABLE ndb.constituentdatabases ADD CONSTRAINT fk_constituentdatabases_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);