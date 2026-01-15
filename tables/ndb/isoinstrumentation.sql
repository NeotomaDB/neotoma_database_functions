-- isoinstrumentation definition

-- Drop table

-- DROP TABLE IF EXISTS isoinstrumentation.isoinstrumentation

CREATE TABLE isoinstrumentation.isoinstrumentation (
    datasetid integer NOT NULL,
    variableid integer NOT NULL,
    isoinstrumentationtypeid integer NULL,
    isosampleintrosystemtypeid integer NULL,
    insterrorpercent double precision NULL,
    insterrorrunsd double precision NULL,
    insterrorlongtermpercent double precision NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isoinstrumentation_pkey PRIMARY KEY (datasetid, variableid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.isoinstrumentation ADD CONSTRAINT fk_isoinstrumentation_isosampleintrosystemtypes FOREIGN KEY (isosampleintrosystemtypeid) REFERENCES ndb.isosampleintrosystemtypes(isosampleintrosystemtypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isoinstrumentation ADD CONSTRAINT fk_isoinstrumentation_isoinstrumentationtypes FOREIGN KEY (isoinstrumentationtypeid) REFERENCES ndb.isoinstrumentationtypes(isoinstrumentationtypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isoinstrumentation ADD CONSTRAINT fk_isoinstrumentation_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isoinstrumentation ADD CONSTRAINT fk_isoinstrumentation_variables FOREIGN KEY (variableid) REFERENCES ndb.variables(variableid) ON UPDATE CASCADE ON DELETE CASCADE;