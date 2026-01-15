-- datasetdatabases definition

-- Drop table

-- DROP TABLE IF EXISTS datasetdatabases.datasetdatabases

CREATE TABLE datasetdatabases.datasetdatabases (
    datasetid integer NOT NULL,
    databaseid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT datasetdatabases_pkey PRIMARY KEY (datasetid, databaseid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.datasetdatabases ADD CONSTRAINT fk_datasetdatabases_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasetdatabases ADD CONSTRAINT fk_datasetdatabases_constituentdatabases FOREIGN KEY (databaseid) REFERENCES ndb.constituentdatabases(databaseid) ON UPDATE CASCADE ON DELETE CASCADE;