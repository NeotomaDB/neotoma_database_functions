-- dataprocessors definition

-- Drop table

-- DROP TABLE IF EXISTS dataprocessors.dataprocessors

CREATE TABLE dataprocessors.dataprocessors (
    datasetid integer NOT NULL,
    contactid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT dataprocessors_pkey PRIMARY KEY (datasetid, contactid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.dataprocessors ADD CONSTRAINT fk_dataprocessors_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.dataprocessors ADD CONSTRAINT fk_dataprocessors_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;