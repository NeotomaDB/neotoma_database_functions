-- ap definition

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


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ap.pollensums IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints