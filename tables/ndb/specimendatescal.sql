-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.specimendatescal

CREATE TABLE IF NOT EXISTS ndb.specimendatescal (

    specimendatecalid integer DEFAULT nextval('ndb.seq_specimendatescal_specimendatecalid'::regclass) NOT NULL,
    specimendateid integer NOT NULL,
    calage double precision NULL,
    calageolder double precision NULL,
    calageyounger double precision NULL,
    calibrationcurveid integer NULL,
    calibrationprogramid integer NULL,
    datecalibrated date NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.specimendatescal IS "";

--- Table indices
CREATE UNIQUE INDEX specimendatescal_pkey ON ndb.specimendatescal USING btree (specimendatecalid)

--- Remove existing constraints if needed
ALTER TABLE ndb.specimendatescal DROP CONSTRAINT IF EXISTS specimendatescal_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.specimendatescal ADD CONSTRAINT specimendatescal_pkey PRIMARY KEY (specimendatecalid);

--- Foreign Key Restraints
ALTER TABLE ndb.specimendatescal ADD CONSTRAINT fk_specimendatescal_calibrationprograms FOREIGN KEY (calibrationprogramid) REFERENCES ndb.calibrationprograms(calibrationprogramid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.specimendatescal ADD CONSTRAINT fk_specimendatescal_calibrationcurves FOREIGN KEY (calibrationcurveid) REFERENCES ndb.calibrationcurves(calibrationcurveid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.specimendatescal ADD CONSTRAINT fk_specimendatescal_specimendates FOREIGN KEY (specimendateid) REFERENCES ndb.specimendates(specimendateid) ON UPDATE CASCADE ON DELETE CASCADE;