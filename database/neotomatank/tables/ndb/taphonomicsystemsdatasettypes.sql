-- ndb.taphonomicsystemsdatasettypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.taphonomicsystemsdatasettypes

CREATE TABLE IF NOT EXISTS ndb.taphonomicsystemsdatasettypes (

    datasettypeid integer NOT NULL,
    taphonomicsystemid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.taphonomicsystemsdatasettypes IS '';
COMMENT ON COLUMN ndb.taphonomicsystemsdatasettypes.datasettypeid IS '';
COMMENT ON COLUMN ndb.taphonomicsystemsdatasettypes.taphonomicsystemid IS '';
COMMENT ON COLUMN ndb.taphonomicsystemsdatasettypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.taphonomicsystemsdatasettypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX taphonomicsystemsdatasettypes_pkey ON ndb.taphonomicsystemsdatasettypes USING btree (datasettypeid, taphonomicsystemid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.taphonomicsystemsdatasettypes DROP CONSTRAINT IF EXISTS taphonomicsystemsdatasettypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.taphonomicsystemsdatasettypes ADD CONSTRAINT taphonomicsystemsdatasettypes_pkey PRIMARY KEY (datasettypeid, taphonomicsystemid);

--- Foreign Key Restraints
ALTER TABLE ndb.taphonomicsystemsdatasettypes ADD CONSTRAINT fk_taphonomicsystemsdatasettypes_taphonomicsystemsdatasettypes FOREIGN KEY (datasettypeid) REFERENCES ndb.datasettypes(datasettypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.taphonomicsystemsdatasettypes ADD CONSTRAINT fk_taphonomicsystemsdatasettypes_taphonomicsystems FOREIGN KEY (taphonomicsystemid) REFERENCES ndb.taphonomicsystems(taphonomicsystemid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.taphonomicsystemsdatasettypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.taphonomicsystemsdatasettypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.taphonomicsystemsdatasettypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.taphonomicsystemsdatasettypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n