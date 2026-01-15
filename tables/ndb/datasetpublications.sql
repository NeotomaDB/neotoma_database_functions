-- datasetpublications definition

-- Drop table

-- DROP TABLE IF EXISTS datasetpublications.datasetpublications

CREATE TABLE datasetpublications.datasetpublications (
    datasetid integer NOT NULL,
    publicationid integer NOT NULL,
    primarypub boolean NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT datasetpublications_pkey PRIMARY KEY (datasetid, publicationid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.datasetpublications ADD CONSTRAINT fk_datasetpublications_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid);
ALTER TABLE ndb.datasetpublications ADD CONSTRAINT fk_datasetpublications_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;