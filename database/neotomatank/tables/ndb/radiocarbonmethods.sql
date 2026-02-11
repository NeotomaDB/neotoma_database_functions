-- ndb.radiocarbonmethods Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.radiocarbonmethods

CREATE TABLE IF NOT EXISTS ndb.radiocarbonmethods (

    radiocarbonmethodid integer DEFAULT nextval('ndb.seq_radiocarbonmethods_radiocarbonmethodid'::regclass) NOT NULL,
    radiocarbonmethod character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.radiocarbonmethods IS "";

--- Table indices
CREATE UNIQUE INDEX radiocarbonmethods_pkey ON ndb.radiocarbonmethods USING btree (radiocarbonmethodid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.radiocarbonmethods DROP CONSTRAINT IF EXISTS radiocarbonmethods_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.radiocarbonmethods ADD CONSTRAINT radiocarbonmethods_pkey PRIMARY KEY (radiocarbonmethodid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.radiocarbonmethods;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.radiocarbonmethods;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.radiocarbonmethods FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.radiocarbonmethods FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();