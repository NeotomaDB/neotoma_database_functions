-- ndb.datasetsubmissiontypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasetsubmissiontypes

CREATE TABLE IF NOT EXISTS ndb.datasetsubmissiontypes (

    submissiontypeid integer DEFAULT nextval('ndb.seq_datasetsubmissiontypes_submissiontypeid'::regclass) NOT NULL,
    submissiontype character varying(80) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.datasetsubmissiontypes IS "Lookup table of Dataset Submission Types. Table is referenced by the DatasetSubmissions table.";

--- Table indices
CREATE UNIQUE INDEX datasetsubmissiontypes_pkey ON ndb.datasetsubmissiontypes USING btree (submissiontypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.datasetsubmissiontypes DROP CONSTRAINT IF EXISTS datasetsubmissiontypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datasetsubmissiontypes ADD CONSTRAINT datasetsubmissiontypes_pkey PRIMARY KEY (submissiontypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasetsubmissiontypes;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasetsubmissiontypes;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.datasetsubmissiontypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.datasetsubmissiontypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();