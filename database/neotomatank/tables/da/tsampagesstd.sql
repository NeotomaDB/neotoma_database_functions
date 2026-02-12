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
COMMENT ON TABLE da.tsampagesstd IS '';
COMMENT ON COLUMN da.tsampagesstd.sampleid IS '';
COMMENT ON COLUMN da.tsampagesstd.age IS '';
COMMENT ON COLUMN da.tsampagesstd.ageolder IS '';
COMMENT ON COLUMN da.tsampagesstd.ageyounger IS '';

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints

--- Triggers