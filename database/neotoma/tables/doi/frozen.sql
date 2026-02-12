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
COMMENT ON TABLE doi.frozen IS 'This table is used to store the Neotoma download object as it is/was at the time of dataset minting.';
COMMENT ON COLUMN doi.frozen.datasetid IS 'Foreign key to ndb.datasets.datasetid. This is not tied to a foreign key constraint so that we can retain information if datasets are deleted.';
COMMENT ON COLUMN doi.frozen.download IS 'jsonb representation of the Neotoma download object (as defined through the API and the doi.meta function)';
COMMENT ON COLUMN doi.frozen.recdatecreated IS 'datetime the record was created.';
COMMENT ON COLUMN doi.frozen.recdatemodified IS 'datetime the record was last modified.';

--- Table indices
CREATE INDEX frozen_datasetid_idx ON doi.frozen USING btree (datasetid)

--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints

--- Triggers