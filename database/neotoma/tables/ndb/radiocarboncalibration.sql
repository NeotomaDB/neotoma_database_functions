-- ndb.radiocarboncalibration Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.radiocarboncalibration

CREATE TABLE IF NOT EXISTS ndb.radiocarboncalibration (

    c14yrbp integer NOT NULL,
    calyrbp integer NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.radiocarboncalibration IS 'Radiocarbon calibration table. This table is intended for quick calibration of age-model radiocarbon dates. These calibrated dates are for perusal and data exploration only. Please see Section 2.5 for a full discussion.';
COMMENT ON COLUMN ndb.radiocarboncalibration.c14yrbp IS 'Age in radiocarbon years BP. The range is -100 to 45,000 by 1-year increments.';
COMMENT ON COLUMN ndb.radiocarboncalibration.calyrbp IS 'Age in calibrated radiocarbon years BP.';

--- Table indices
CREATE UNIQUE INDEX radiocarboncalibration_pkey ON ndb.radiocarboncalibration USING btree (c14yrbp)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.radiocarboncalibration DROP CONSTRAINT IF EXISTS radiocarboncalibration_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.radiocarboncalibration ADD CONSTRAINT radiocarboncalibration_pkey PRIMARY KEY (c14yrbp);

--- Foreign Key Restraints

--- Triggers