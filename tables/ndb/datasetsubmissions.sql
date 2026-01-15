-- datasetsubmissions definition

-- Drop table

-- DROP TABLE IF EXISTS datasetsubmissions.datasetsubmissions

CREATE TABLE datasetsubmissions.datasetsubmissions (
    submissionid integer DEFAULT nextval('ndb.seq_datasetsubmissions_submissionid'::regclass) NOT NULL,
    datasetid integer NOT NULL,
    databaseid integer NULL,
    contactid integer NULL,
    submissiontypeid integer NULL,
    submissiondate date NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT datasetsubmissions_pkey PRIMARY KEY (submissionid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.datasetsubmissions ADD CONSTRAINT fk_datasetsubmissions_datasetsubmissiontypes FOREIGN KEY (submissiontypeid) REFERENCES ndb.datasetsubmissiontypes(submissiontypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasetsubmissions ADD CONSTRAINT fk_datasetsubmissions_constituentdatabases FOREIGN KEY (databaseid) REFERENCES ndb.constituentdatabases(databaseid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasetsubmissions ADD CONSTRAINT fk_datasetsubmissions_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;
ALTER TABLE ndb.datasetsubmissions ADD CONSTRAINT fk_datasetsubmissions_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;