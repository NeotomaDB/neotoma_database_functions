-- ndb.collectors Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.collectors

CREATE TABLE IF NOT EXISTS ndb.collectors (

    collectorid integer DEFAULT nextval('ndb.seq_collectors_collectorid'::regclass) NOT NULL,
    collectionunitid integer NOT NULL,
    contactid integer NOT NULL,
    collectororder integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.collectors IS 'The Collectors table lists the people who collected Collection Units.';
COMMENT ON COLUMN ndb.collectors.collectorid IS 'An arbitrary Collector identification number.';
COMMENT ON COLUMN ndb.collectors.collectionunitid IS 'CollectionUnit collected. Field links to CollectionUnits table.';
COMMENT ON COLUMN ndb.collectors.contactid IS 'Person who collected the CollectionUnit. Multiple individuals are listed in separate records. Field links to the Contacts table.';
COMMENT ON COLUMN ndb.collectors.collectororder IS 'Order in which Collectors should be listed.';
COMMENT ON COLUMN ndb.collectors.recdatecreated IS '';
COMMENT ON COLUMN ndb.collectors.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX collectors_pkey ON ndb.collectors USING btree (collectorid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.collectors DROP CONSTRAINT IF EXISTS collectors_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.collectors ADD CONSTRAINT collectors_pkey PRIMARY KEY (collectorid);

--- Foreign Key Restraints
ALTER TABLE ndb.collectors ADD CONSTRAINT fk_collectors_collectionunits FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.collectors ADD CONSTRAINT fk_collectors_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.collectors;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.collectors;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.collectors FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.collectors FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n