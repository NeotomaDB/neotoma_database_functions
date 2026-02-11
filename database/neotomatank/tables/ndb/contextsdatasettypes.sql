-- ndb.contextsdatasettypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.contextsdatasettypes

CREATE TABLE IF NOT EXISTS ndb.contextsdatasettypes (

    datasettypeid integer NOT NULL,
    variablecontextid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.contextsdatasettypes IS "";

--- Table indices
CREATE UNIQUE INDEX contextsdatasettypes_pkey ON ndb.contextsdatasettypes USING btree (datasettypeid, variablecontextid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.contextsdatasettypes DROP CONSTRAINT IF EXISTS contextsdatasettypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.contextsdatasettypes ADD CONSTRAINT contextsdatasettypes_pkey PRIMARY KEY (datasettypeid, variablecontextid);

--- Foreign Key Restraints
ALTER TABLE ndb.contextsdatasettypes ADD CONSTRAINT fk_contextsdatasettypes_datasettypes FOREIGN KEY (datasettypeid) REFERENCES ndb.datasettypes(datasettypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.contextsdatasettypes ADD CONSTRAINT fk_contextsdatasettypes_variablecontexts FOREIGN KEY (variablecontextid) REFERENCES ndb.variablecontexts(variablecontextid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.contextsdatasettypes;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.contextsdatasettypes;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.contextsdatasettypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.contextsdatasettypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();