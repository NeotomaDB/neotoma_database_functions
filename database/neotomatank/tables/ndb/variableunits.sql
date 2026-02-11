-- ndb.variableunits Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.variableunits

CREATE TABLE IF NOT EXISTS ndb.variableunits (

    variableunitsid integer DEFAULT nextval('ndb.seq_variableunits_variableunitsid'::regclass) NOT NULL,
    variableunits character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.variableunits IS "Lookup table of Variable Units. Table is referenced by the Variables table.";

--- Table indices
CREATE UNIQUE INDEX variableunits_pkey ON ndb.variableunits USING btree (variableunitsid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.variableunits DROP CONSTRAINT IF EXISTS variableunits_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.variableunits ADD CONSTRAINT variableunits_pkey PRIMARY KEY (variableunitsid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.variableunits;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.variableunits;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.variableunits FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.variableunits FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();