-- da.tsampagesstd Table definition

-- Drop table

-- DROP TABLE IF EXISTS da.tsampagesstd

CREATE TABLE IF NOT EXISTS da.tsampagesstd (

    sampleid integer NOT NULL,
    age double precision NULL,
    ageolder double precision NULL,
    ageyounger double precision NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE da.tsampagesstd IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints

--- Triggers