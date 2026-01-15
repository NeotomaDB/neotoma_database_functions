-- isostandards definition

-- Drop table

-- DROP TABLE IF EXISTS isostandards.isostandards

CREATE TABLE isostandards.isostandards (
    datasetid integer NOT NULL,
    variableid integer NOT NULL,
    isostandardid integer NOT NULL,
    value double precision NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isostandards_pkey PRIMARY KEY (datasetid, variableid, isostandardid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.isostandards ADD CONSTRAINT fk_isostandards_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isostandards ADD CONSTRAINT fk_isostandards_variables FOREIGN KEY (variableid) REFERENCES ndb.variables(variableid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isostandards ADD CONSTRAINT fk_isostandards_isostandardtypes FOREIGN KEY (isostandardid) REFERENCES ndb.isostandardtypes(isostandardtypeid) ON UPDATE CASCADE ON DELETE CASCADE;