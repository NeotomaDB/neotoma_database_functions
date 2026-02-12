-- ndb.relativeageunits Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.relativeageunits

CREATE TABLE IF NOT EXISTS ndb.relativeageunits (

    relativeageunitid integer DEFAULT nextval('ndb.seq_relativeageunits_relativeageunitid'::regclass) NOT NULL,
    relativeageunit character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.relativeageunits IS 'Lookup table of RelativeAgeUnits. Table is referenced by the RelativeAges table.';
COMMENT ON COLUMN ndb.relativeageunits.relativeageunitid IS 'An arbitrary Relative Age Unit identification number.';
COMMENT ON COLUMN ndb.relativeageunits.relativeageunit IS 'Relative Age Unit. Below are the Relative Age Units for the «Geologic time scale» with an example Relative Age.';
COMMENT ON COLUMN ndb.relativeageunits.recdatecreated IS '';
COMMENT ON COLUMN ndb.relativeageunits.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX relativeageunits_pkey ON ndb.relativeageunits USING btree (relativeageunitid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.relativeageunits DROP CONSTRAINT IF EXISTS relativeageunits_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.relativeageunits ADD CONSTRAINT relativeageunits_pkey PRIMARY KEY (relativeageunitid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.relativeageunits;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.relativeageunits;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.relativeageunits FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.relativeageunits FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n