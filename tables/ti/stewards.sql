-- ti definition

-- Drop table

-- DROP TABLE IF EXISTS ti.stewards

CREATE TABLE IF NOT EXISTS ti.stewards (

    stewardid integer DEFAULT nextval('ti.stewardid_seq'::regclass) NOT NULL,
    contactid integer NOT NULL,
    username character varying(15) NOT NULL,
    pwd character varying(15) NOT NULL,
    taxonomyexpert boolean NOT NULL,
    recdatecreated timestamp(0) without time zone NULL,
    recdatemodified timestamp(0) without time zone NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ti.stewards IS "";

--- Table indices
CREATE UNIQUE INDEX stewards_pkey ON ti.stewards USING btree (stewardid)

--- Remove existing constraints if needed
ALTER TABLE ti.stewards DROP CONSTRAINT IF EXISTS stewards_pkey;

--- Non-foreign key constraints
ALTER TABLE ti.stewards ADD CONSTRAINT stewards_pkey PRIMARY KEY (stewardid);

--- Foreign Key Restraints
ALTER TABLE ti.stewards ADD CONSTRAINT fk_stewards_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;