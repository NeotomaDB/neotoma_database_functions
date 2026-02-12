-- ndb.calibrationprograms Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.calibrationprograms

CREATE TABLE IF NOT EXISTS ndb.calibrationprograms (

    calibrationprogramid integer DEFAULT nextval('ndb.seq_calibrationprograms_calibrationprogramid'::regclass) NOT NULL,
    calibrationprogram character varying(24) NOT NULL,
    version character varying(24) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.calibrationprograms IS '';
COMMENT ON COLUMN ndb.calibrationprograms.calibrationprogramid IS '';
COMMENT ON COLUMN ndb.calibrationprograms.calibrationprogram IS '';
COMMENT ON COLUMN ndb.calibrationprograms.version IS '';
COMMENT ON COLUMN ndb.calibrationprograms.recdatecreated IS '';
COMMENT ON COLUMN ndb.calibrationprograms.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX calibrationprograms_pkey ON ndb.calibrationprograms USING btree (calibrationprogramid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.calibrationprograms DROP CONSTRAINT IF EXISTS calibrationprograms_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.calibrationprograms ADD CONSTRAINT calibrationprograms_pkey PRIMARY KEY (calibrationprogramid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.calibrationprograms;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.calibrationprograms;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.calibrationprograms FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.calibrationprograms FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n