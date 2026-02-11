-- doi definition

-- Drop table

-- DROP TABLE IF EXISTS doi.frozen

CREATE TABLE IF NOT EXISTS doi.frozen (

    datasetid integer NULL,
    download jsonb NOT NULL,
    recdatecreated timestamp(6) without time zone DEFAULT now() NULL,
    recmodified timestamp(6) without time zone DEFAULT now() NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE doi.frozen IS "";

--- Table indices
CREATE INDEX frozen_datasetid_idx ON doi.frozen USING btree (datasetid)

--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints