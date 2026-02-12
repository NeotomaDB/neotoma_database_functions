-- ndb.calibrationcurves Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.calibrationcurves

CREATE TABLE IF NOT EXISTS ndb.calibrationcurves (

    calibrationcurveid integer DEFAULT nextval('ndb.seq_calibrationcurves_calibrationcurveid'::regclass) NOT NULL,
    calibrationcurve character varying(24) NOT NULL,
    publicationid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.calibrationcurves IS '';
COMMENT ON COLUMN ndb.calibrationcurves.calibrationcurveid IS '';
COMMENT ON COLUMN ndb.calibrationcurves.calibrationcurve IS '';
COMMENT ON COLUMN ndb.calibrationcurves.publicationid IS '';
COMMENT ON COLUMN ndb.calibrationcurves.recdatecreated IS '';
COMMENT ON COLUMN ndb.calibrationcurves.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX calibrationcurves_pkey ON ndb.calibrationcurves USING btree (calibrationcurveid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.calibrationcurves DROP CONSTRAINT IF EXISTS calibrationcurves_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.calibrationcurves ADD CONSTRAINT calibrationcurves_pkey PRIMARY KEY (calibrationcurveid);

--- Foreign Key Restraints
ALTER TABLE ndb.calibrationcurves ADD CONSTRAINT fk_calibrationcurves_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.calibrationcurves;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.calibrationcurves;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.calibrationcurves FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.calibrationcurves FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n