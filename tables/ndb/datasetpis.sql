-- datasetpis definition

-- Drop table

-- DROP TABLE IF EXISTS datasetpis.datasetpis

CREATE TABLE datasetpis.datasetpis (
    datasetid integer NOT NULL,
    contactid integer NOT NULL,
    piorder integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.datasetpis ADD CONSTRAINT fk_datasetpis_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;
ALTER TABLE ndb.datasetpis ADD CONSTRAINT fk_datasetpis_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;