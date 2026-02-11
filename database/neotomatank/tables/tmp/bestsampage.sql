-- tmp.bestsampage Table definition

-- Drop table

-- DROP TABLE IF EXISTS tmp.bestsampage

CREATE TABLE IF NOT EXISTS tmp.bestsampage (

    sampleid integer NOT NULL,
    datasetid integer NULL,
    age double precision NULL,
    ageolder double precision NULL,
    ageyounger double precision NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE tmp.bestsampage IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints

--- Triggers