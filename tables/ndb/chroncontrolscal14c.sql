-- chroncontrolscal14c definition

-- Drop table

-- DROP TABLE IF EXISTS chroncontrolscal14c.chroncontrolscal14c

CREATE TABLE chroncontrolscal14c.chroncontrolscal14c (
    chroncontrolid integer NOT NULL,
    calibrationcurveid integer NOT NULL,
    calibrationprogramid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT chroncontrolscal14c_pkey PRIMARY KEY (chroncontrolid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.chroncontrolscal14c ADD CONSTRAINT fk_chroncontrolscal14c_calibrationcurves FOREIGN KEY (calibrationcurveid) REFERENCES ndb.calibrationcurves(calibrationcurveid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrolscal14c ADD CONSTRAINT fk_chroncontrolscal14c_chroncontrols FOREIGN KEY (chroncontrolid) REFERENCES ndb.chroncontrols(chroncontrolid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrolscal14c ADD CONSTRAINT fk_chroncontrolscal14c_calibrationprograms FOREIGN KEY (calibrationprogramid) REFERENCES ndb.calibrationprograms(calibrationprogramid) ON UPDATE CASCADE ON DELETE CASCADE;