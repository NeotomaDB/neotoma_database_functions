-- ndb.chroncontrolscal14c Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.chroncontrolscal14c

CREATE TABLE IF NOT EXISTS ndb.chroncontrolscal14c (

    chroncontrolid integer NOT NULL,
    calibrationcurveid integer NOT NULL,
    calibrationprogramid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.chroncontrolscal14c IS "";

--- Table indices
CREATE UNIQUE INDEX chroncontrolscal14c_pkey ON ndb.chroncontrolscal14c USING btree (chroncontrolid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.chroncontrolscal14c DROP CONSTRAINT IF EXISTS chroncontrolscal14c_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.chroncontrolscal14c ADD CONSTRAINT chroncontrolscal14c_pkey PRIMARY KEY (chroncontrolid);

--- Foreign Key Restraints
ALTER TABLE ndb.chroncontrolscal14c ADD CONSTRAINT fk_chroncontrolscal14c_calibrationprograms FOREIGN KEY (calibrationprogramid) REFERENCES ndb.calibrationprograms(calibrationprogramid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrolscal14c ADD CONSTRAINT fk_chroncontrolscal14c_chroncontrols FOREIGN KEY (chroncontrolid) REFERENCES ndb.chroncontrols(chroncontrolid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrolscal14c ADD CONSTRAINT fk_chroncontrolscal14c_calibrationcurves FOREIGN KEY (calibrationcurveid) REFERENCES ndb.calibrationcurves(calibrationcurveid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chroncontrolscal14c;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chroncontrolscal14c;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.chroncontrolscal14c FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.chroncontrolscal14c FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();