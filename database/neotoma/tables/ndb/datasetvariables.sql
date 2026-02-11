-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasetvariables

CREATE TABLE IF NOT EXISTS ndb.datasetvariables (

    datasetvariableid integer DEFAULT nextval('ndb.seq_datasetvariables_datasetvariableid'::regclass) NOT NULL,
    datasetid integer NOT NULL,
    variableid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.datasetvariables IS "";

--- Table indices
CREATE UNIQUE INDEX datasetvariables_pkey ON ndb.datasetvariables USING btree (datasetvariableid)

--- Remove existing constraints if needed
ALTER TABLE ndb.datasetvariables DROP CONSTRAINT IF EXISTS datasetvariables_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datasetvariables ADD CONSTRAINT datasetvariables_pkey PRIMARY KEY (datasetvariableid);

--- Foreign Key Restraints
ALTER TABLE ndb.datasetvariables ADD CONSTRAINT fk_datasetvariables_variables FOREIGN KEY (variableid) REFERENCES ndb.variables(variableid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasetvariables ADD CONSTRAINT fk_datasetvariables_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;