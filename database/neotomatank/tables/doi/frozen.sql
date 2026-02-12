-- doi.frozen Table definition

-- Drop table

-- DROP TABLE IF EXISTS doi.frozen

CREATE TABLE IF NOT EXISTS doi.frozen (

    datasetid integer NULL,
    download jsonb NOT NULL,
    recdatecreated timestamp(6) without time zone DEFAULT now() NULL,
    recdatemodified timestamp(6) without time zone DEFAULT now() NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE doi.frozen IS '';
COMMENT ON COLUMN doi.frozen.datasetid IS '';
COMMENT ON COLUMN doi.frozen.download IS '';
COMMENT ON COLUMN doi.frozen.recdatecreated IS '';
COMMENT ON COLUMN doi.frozen.recdatemodified IS '';

--- Table indices
CREATE INDEX frozen_datasetid_idx ON doi.frozen USING btree (datasetid)

--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints

--- Triggers