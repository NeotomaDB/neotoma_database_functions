-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.data

CREATE TABLE IF NOT EXISTS ndb.data (

    dataid integer DEFAULT nextval('ndb.seq_data_dataid'::regclass) NOT NULL,
    sampleid integer NOT NULL,
    variableid integer NOT NULL,
    value double precision NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.data IS "The primary data table in the database. Each occurrence of a Variable in a sample comprises a record in the Data table.";

--- Table indices
CREATE UNIQUE INDEX data_pkey ON ndb.data USING btree (dataid);
CREATE INDEX data_sample_idx ON ndb.data USING btree (sampleid);
CREATE INDEX data_variable_idx ON ndb.data USING btree (variableid)

--- Remove existing constraints if needed
ALTER TABLE ndb.data DROP CONSTRAINT IF EXISTS data_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.data ADD CONSTRAINT data_pkey PRIMARY KEY (dataid);

--- Foreign Key Restraints
ALTER TABLE ndb.data ADD CONSTRAINT fk_data_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.data ADD CONSTRAINT fk_data_variables FOREIGN KEY (variableid) REFERENCES ndb.variables(variableid) ON UPDATE CASCADE ON DELETE CASCADE;