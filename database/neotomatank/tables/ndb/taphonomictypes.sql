-- ndb.taphonomictypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.taphonomictypes

CREATE TABLE IF NOT EXISTS ndb.taphonomictypes (

    taphonomictypeid integer DEFAULT nextval('ndb.seq_taphonomictypes_taphonomictypeid'::regclass) NOT NULL,
    taphonomicsystemid integer NULL,
    taphonomictype character varying(64) NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.taphonomictypes IS '';
COMMENT ON COLUMN ndb.taphonomictypes.taphonomictypeid IS '';
COMMENT ON COLUMN ndb.taphonomictypes.taphonomicsystemid IS '';
COMMENT ON COLUMN ndb.taphonomictypes.taphonomictype IS '';
COMMENT ON COLUMN ndb.taphonomictypes.notes IS '';
COMMENT ON COLUMN ndb.taphonomictypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.taphonomictypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX taphonomictypes_pkey ON ndb.taphonomictypes USING btree (taphonomictypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.taphonomictypes DROP CONSTRAINT IF EXISTS taphonomictypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.taphonomictypes ADD CONSTRAINT taphonomictypes_pkey PRIMARY KEY (taphonomictypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.taphonomictypes ADD CONSTRAINT fk_taphonomictypes_taphonomicsystems FOREIGN KEY (taphonomicsystemid) REFERENCES ndb.taphonomicsystems(taphonomicsystemid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.taphonomictypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.taphonomictypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.taphonomictypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.taphonomictypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n