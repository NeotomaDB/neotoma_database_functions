-- ndb.unitsdatasettypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.unitsdatasettypes

CREATE TABLE IF NOT EXISTS ndb.unitsdatasettypes (

    datasettypeid integer NOT NULL,
    variableunitsid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.unitsdatasettypes IS "Join table, associating measurement units with various datasettypes.";

--- Table indices
CREATE UNIQUE INDEX unitsdatasettypes_pkey ON ndb.unitsdatasettypes USING btree (datasettypeid, variableunitsid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.unitsdatasettypes DROP CONSTRAINT IF EXISTS unitsdatasettypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.unitsdatasettypes ADD CONSTRAINT unitsdatasettypes_pkey PRIMARY KEY (datasettypeid, variableunitsid);

--- Foreign Key Restraints
ALTER TABLE ndb.unitsdatasettypes ADD CONSTRAINT fk_unitsdatasettypes_variableunits FOREIGN KEY (variableunitsid) REFERENCES ndb.variableunits(variableunitsid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.unitsdatasettypes ADD CONSTRAINT fk_unitsdatasettypes_datasettypes FOREIGN KEY (datasettypeid) REFERENCES ndb.datasettypes(datasettypeid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.unitsdatasettypes;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.unitsdatasettypes;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.unitsdatasettypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.unitsdatasettypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();