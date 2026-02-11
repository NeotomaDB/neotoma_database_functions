-- ti.stewards Table definition

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


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ti.stewards IS "";

--- Table indices
CREATE UNIQUE INDEX stewards_pkey ON ti.stewards USING btree (stewardid)

--- Remove existing constraints if needed
-- ALTER TABLE ti.stewards DROP CONSTRAINT IF EXISTS stewards_pkey;

--- Non-foreign key constraints
ALTER TABLE ti.stewards ADD CONSTRAINT stewards_pkey PRIMARY KEY (stewardid);

--- Foreign Key Restraints
ALTER TABLE ti.stewards ADD CONSTRAINT fk_stewards_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS record_update ON ti.stewards;
-- DROP TRIGGER IF EXISTS recordcreated ON ti.stewards;
-- DROP TRIGGER IF EXISTS record_update ON ti.stewards;
CREATE TRIGGER record_update BEFORE INSERT ON ti.stewards FOR EACH ROW EXECUTE FUNCTION ti.update_recdatemodified();
CREATE TRIGGER recordcreated BEFORE INSERT ON ti.stewards FOR EACH ROW EXECUTE FUNCTION ti.reccreate();
CREATE TRIGGER record_update BEFORE UPDATE ON ti.stewards FOR EACH ROW EXECUTE FUNCTION ti.update_recdatemodified();