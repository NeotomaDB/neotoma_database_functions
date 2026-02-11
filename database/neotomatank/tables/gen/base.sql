-- gen.base Table definition

-- Drop table

-- DROP TABLE IF EXISTS gen.base

CREATE TABLE IF NOT EXISTS gen.base (

    sampleid integer NOT NULL,
    datasetid integer NULL,
    occurid integer NULL,
    taxonid integer NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE gen.base IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints

--- Triggers