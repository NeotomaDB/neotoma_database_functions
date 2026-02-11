-- ap.sitegadm Table definition

-- Drop table

-- DROP TABLE IF EXISTS ap.sitegadm

CREATE TABLE IF NOT EXISTS ap.sitegadm (

    siteid integer NULL,
    fid integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ap.sitegadm IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints

--- Triggers