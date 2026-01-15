-- datasetvariables definition

-- Drop table

-- DROP TABLE IF EXISTS datasetvariables.datasetvariables

CREATE TABLE datasetvariables.datasetvariables (
    datasetvariableid integer DEFAULT nextval('ndb.seq_datasetvariables_datasetvariableid'::regclass) NOT NULL,
    datasetid integer NOT NULL,
    variableid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT datasetvariables_pkey PRIMARY KEY (datasetvariableid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.datasetvariables ADD CONSTRAINT fk_datasetvariables_variables FOREIGN KEY (variableid) REFERENCES ndb.variables(variableid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasetvariables ADD CONSTRAINT fk_datasetvariables_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;