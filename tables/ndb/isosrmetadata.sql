-- isosrmetadata definition

-- Drop table

-- DROP TABLE IF EXISTS isosrmetadata.isosrmetadata

CREATE TABLE isosrmetadata.isosrmetadata (
    datasetid integer NOT NULL,
    variableid integer NOT NULL,
    srlocalvalue double precision NULL,
    srlocalgeolcontext text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isosrmetadata_pkey PRIMARY KEY (datasetid, variableid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.isosrmetadata ADD CONSTRAINT fk_isosrmetadata_variables FOREIGN KEY (variableid) REFERENCES ndb.variables(variableid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isosrmetadata ADD CONSTRAINT fk_isosrmetadata_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;