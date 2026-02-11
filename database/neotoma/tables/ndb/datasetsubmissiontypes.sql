-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasetsubmissiontypes

CREATE TABLE IF NOT EXISTS ndb.datasetsubmissiontypes (

    submissiontypeid integer DEFAULT nextval('ndb.seq_datasetsubmissiontypes_submissiontypeid'::regclass) NOT NULL,
    submissiontype character varying(80) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.datasetsubmissiontypes IS "Lookup table of Dataset Submission Types. Table is referenced by the DatasetSubmissions table.";

--- Table indices
CREATE UNIQUE INDEX datasetsubmissiontypes_pkey ON ndb.datasetsubmissiontypes USING btree (submissiontypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.datasetsubmissiontypes DROP CONSTRAINT IF EXISTS datasetsubmissiontypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datasetsubmissiontypes ADD CONSTRAINT datasetsubmissiontypes_pkey PRIMARY KEY (submissiontypeid);

--- Foreign Key Restraints