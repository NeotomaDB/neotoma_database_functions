-- doi.doimeta Table definition

-- Drop table

-- DROP TABLE IF EXISTS doi.doimeta

CREATE TABLE IF NOT EXISTS doi.doimeta (

    doi character varying NOT NULL,
    meta jsonb NULL,
    datasetid integer NULL,
    recdatecreated timestamp with time zone DEFAULT now() NOT NULL,
    recdatemodified timestamp with time zone DEFAULT now() NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE doi.doimeta IS "";

--- Table indices
CREATE UNIQUE INDEX doimeta_pkey ON doi.doimeta USING btree (doi);
CREATE UNIQUE INDEX doimeta_doi_idx ON doi.doimeta USING btree (doi, datasetid)

--- Remove existing constraints if needed
-- ALTER TABLE doi.doimeta DROP CONSTRAINT IF EXISTS doimeta_pkey;

--- Non-foreign key constraints
ALTER TABLE doi.doimeta ADD CONSTRAINT doimeta_pkey PRIMARY KEY (doi);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS update_modified ON doi.doimeta;
CREATE TRIGGER update_modified AFTER UPDATE ON doi.doimeta FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();