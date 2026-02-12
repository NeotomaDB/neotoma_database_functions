-- ap.pollensums Table definition

-- Drop table

-- DROP TABLE IF EXISTS ap.pollensums

CREATE TABLE IF NOT EXISTS ap.pollensums (

    sampleid integer NOT NULL,
    trsh double precision NULL,
    palm double precision NULL,
    uphe double precision NULL,
    succ double precision NULL,
    vacr double precision NULL,
    upbr double precision NULL,
    fung double precision NULL,
    aqvp double precision NULL,
    aqbr double precision NULL,
    mang double precision NULL,
    unid double precision NULL,
    anac double precision NULL,
    seed double precision NULL,
    total double precision NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ap.pollensums IS '';
COMMENT ON COLUMN ap.pollensums.sampleid IS '';
COMMENT ON COLUMN ap.pollensums.trsh IS '';
COMMENT ON COLUMN ap.pollensums.palm IS '';
COMMENT ON COLUMN ap.pollensums.uphe IS '';
COMMENT ON COLUMN ap.pollensums.succ IS '';
COMMENT ON COLUMN ap.pollensums.vacr IS '';
COMMENT ON COLUMN ap.pollensums.upbr IS '';
COMMENT ON COLUMN ap.pollensums.fung IS '';
COMMENT ON COLUMN ap.pollensums.aqvp IS '';
COMMENT ON COLUMN ap.pollensums.aqbr IS '';
COMMENT ON COLUMN ap.pollensums.mang IS '';
COMMENT ON COLUMN ap.pollensums.unid IS '';
COMMENT ON COLUMN ap.pollensums.anac IS '';
COMMENT ON COLUMN ap.pollensums.seed IS '';
COMMENT ON COLUMN ap.pollensums.total IS '';

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints

--- Triggers