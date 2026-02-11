-- ndb.datasetsubmissions Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasetsubmissions

CREATE TABLE IF NOT EXISTS ndb.datasetsubmissions (

    submissionid integer DEFAULT nextval('ndb.seq_datasetsubmissions_submissionid'::regclass) NOT NULL,
    datasetid integer NOT NULL,
    databaseid integer NULL,
    contactid integer NULL,
    submissiontypeid integer NULL,
    submissiondate date NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.datasetsubmissions IS "Submissions to the database are of Datasets. Submissions may be original submissions, resubmissions, compilations from other databases, or recompilations. See the description of the DatasetSubmissionTypes table.";

--- Table indices
CREATE UNIQUE INDEX datasetsubmissions_pkey ON ndb.datasetsubmissions USING btree (submissionid);
CREATE INDEX ix_datasetid_datasetsubmissions ON ndb.datasetsubmissions USING btree (datasetid) WITH (fillfactor='10');
CREATE INDEX ix_projectid_datasetsubmissions ON ndb.datasetsubmissions USING btree (databaseid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.datasetsubmissions DROP CONSTRAINT IF EXISTS datasetsubmissions_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datasetsubmissions ADD CONSTRAINT datasetsubmissions_pkey PRIMARY KEY (submissionid);

--- Foreign Key Restraints
ALTER TABLE ndb.datasetsubmissions ADD CONSTRAINT fk_datasetsubmissions_datasetsubmissiontypes FOREIGN KEY (submissiontypeid) REFERENCES ndb.datasetsubmissiontypes(submissiontypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasetsubmissions ADD CONSTRAINT fk_datasetsubmissions_constituentdatabases FOREIGN KEY (databaseid) REFERENCES ndb.constituentdatabases(databaseid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasetsubmissions ADD CONSTRAINT fk_datasetsubmissions_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;
ALTER TABLE ndb.datasetsubmissions ADD CONSTRAINT fk_datasetsubmissions_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasetsubmissions;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasetsubmissions;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.datasetsubmissions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.datasetsubmissions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();