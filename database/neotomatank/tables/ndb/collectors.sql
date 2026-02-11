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
COMMENT ON TABLE ndb.collectors IS "The Collectors table lists the people who collected Collection Units.";

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
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.collectors;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.collectors;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.collectors FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.collectors FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();