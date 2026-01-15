-- data definition

-- Drop table

-- DROP TABLE IF EXISTS data.data

CREATE TABLE data.data (
    dataid integer DEFAULT nextval('ndb.seq_data_dataid'::regclass) NOT NULL,
    sampleid integer NOT NULL,
    variableid integer NOT NULL,
    value double precision NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT data_pkey PRIMARY KEY (dataid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.data ADD CONSTRAINT fk_data_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.data ADD CONSTRAINT fk_data_variables FOREIGN KEY (variableid) REFERENCES ndb.variables(variableid) ON UPDATE CASCADE ON DELETE CASCADE;