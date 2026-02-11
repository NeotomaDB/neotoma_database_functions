-- ndb.relativeagescales Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.relativeagescales

CREATE TABLE IF NOT EXISTS ndb.relativeagescales (

    relativeagescaleid integer DEFAULT nextval('ndb.seq_relativeagescales_relativeagescaleid'::regclass) NOT NULL,
    relativeagescale character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.relativeagescales IS "Lookup table of Relative Age Scales. Table is referenced by the RelativeAges table.";

--- Table indices
CREATE UNIQUE INDEX relativeagescales_pkey ON ndb.relativeagescales USING btree (relativeagescaleid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.relativeagescales DROP CONSTRAINT IF EXISTS relativeagescales_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.relativeagescales ADD CONSTRAINT relativeagescales_pkey PRIMARY KEY (relativeagescaleid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.relativeagescales;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.relativeagescales;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.relativeagescales FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.relativeagescales FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();