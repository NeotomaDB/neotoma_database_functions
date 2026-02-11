-- ndb.fractiondated Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.fractiondated

CREATE TABLE IF NOT EXISTS ndb.fractiondated (

    fractionid integer DEFAULT nextval('ndb.seq_fractiondated_fractionid'::regclass) NOT NULL,
    fraction character varying(80) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.fractiondated IS "";

--- Table indices
CREATE UNIQUE INDEX fractiondated_pkey ON ndb.fractiondated USING btree (fractionid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.fractiondated DROP CONSTRAINT IF EXISTS fractiondated_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.fractiondated ADD CONSTRAINT fractiondated_pkey PRIMARY KEY (fractionid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.fractiondated;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.fractiondated;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.fractiondated FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.fractiondated FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();