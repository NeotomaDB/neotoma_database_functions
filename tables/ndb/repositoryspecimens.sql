-- repositoryspecimens definition

-- Drop table

-- DROP TABLE IF EXISTS repositoryspecimens.repositoryspecimens

CREATE TABLE repositoryspecimens.repositoryspecimens (
    datasetid integer NOT NULL,
    repositoryid integer NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT repositoryspecimens_pkey PRIMARY KEY (datasetid, repositoryid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.repositoryspecimens ADD CONSTRAINT fk_repositoryspecimens_repositoryinstitutions FOREIGN KEY (repositoryid) REFERENCES ndb.repositoryinstitutions(repositoryid);
ALTER TABLE ndb.repositoryspecimens ADD CONSTRAINT fk_repositoryspecimens_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;