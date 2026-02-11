-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.contactstatuses

CREATE TABLE IF NOT EXISTS ndb.contactstatuses (

    contactstatusid integer DEFAULT nextval('ndb.seq_contactstatuses_contactstatusid'::regclass) NOT NULL,
    contactstatus character varying(16) NULL,
    statusdescription character varying(255) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.contactstatuses IS "Lookup table of Contact Statuses. Table is referenced by the Contacts table.";

--- Table indices
CREATE UNIQUE INDEX contactstatuses_pkey ON ndb.contactstatuses USING btree (contactstatusid)

--- Remove existing constraints if needed
ALTER TABLE ndb.contactstatuses DROP CONSTRAINT IF EXISTS contactstatuses_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.contactstatuses ADD CONSTRAINT contactstatuses_pkey PRIMARY KEY (contactstatusid);

--- Foreign Key Restraints