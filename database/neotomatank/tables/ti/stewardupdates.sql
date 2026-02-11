-- ti.stewardupdates Table definition

-- Drop table

-- DROP TABLE IF EXISTS ti.stewardupdates

CREATE TABLE IF NOT EXISTS ti.stewardupdates (

    updateid integer NOT NULL,
    contactid integer NOT NULL,
    tablename character varying(64) NOT NULL,
    pk1 integer NULL,
    pk2 integer NULL,
    pk3 character varying(24) NULL,
    operation character varying(24) NOT NULL,
    columnname character varying(64) NULL,
    dateupdated timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ti.stewardupdates IS "";

--- Table indices
CREATE UNIQUE INDEX stewardupdates_pkey ON ti.stewardupdates USING btree (updateid)

--- Remove existing constraints if needed
-- ALTER TABLE ti.stewardupdates DROP CONSTRAINT IF EXISTS stewardupdates_pkey;

--- Non-foreign key constraints
ALTER TABLE ti.stewardupdates ADD CONSTRAINT stewardupdates_pkey PRIMARY KEY (updateid);

--- Foreign Key Restraints
ALTER TABLE ti.stewardupdates ADD CONSTRAINT fk_stewardupdates_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);

--- Triggers
-- DROP TRIGGER IF EXISTS record_update ON ti.stewardupdates;
-- DROP TRIGGER IF EXISTS record_update ON ti.stewardupdates;
CREATE TRIGGER record_update BEFORE INSERT ON ti.stewardupdates FOR EACH ROW EXECUTE FUNCTION ti.update_recdatemodified();
CREATE TRIGGER record_update BEFORE UPDATE ON ti.stewardupdates FOR EACH ROW EXECUTE FUNCTION ti.update_recdatemodified();