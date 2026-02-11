-- ndb.sitestemp Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.sitestemp

CREATE TABLE IF NOT EXISTS ndb.sitestemp (

    siteid integer NOT NULL,
    sitename character varying(128) NULL,
    longitudeeast double precision NULL,
    latitudenorth double precision NULL,
    longitudewest double precision NULL,
    latitudesouth double precision NULL,
    altitude double precision NULL,
    area double precision NULL,
    sitedescription text NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    geog text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.sitestemp IS "";

--- Table indices
CREATE UNIQUE INDEX sitestemp_pkey ON ndb.sitestemp USING btree (siteid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.sitestemp DROP CONSTRAINT IF EXISTS sitestemp_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.sitestemp ADD CONSTRAINT sitestemp_pkey PRIMARY KEY (siteid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.sitestemp;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.sitestemp;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.sitestemp FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.sitestemp FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();