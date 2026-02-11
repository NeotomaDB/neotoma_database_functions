-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isostandards

CREATE TABLE IF NOT EXISTS ndb.isostandards (

    datasetid integer NOT NULL,
    variableid integer NOT NULL,
    isostandardid integer NOT NULL,
    value double precision NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.isostandards IS "";

--- Table indices
CREATE UNIQUE INDEX isostandards_pkey ON ndb.isostandards USING btree (datasetid, variableid, isostandardid)

--- Remove existing constraints if needed
ALTER TABLE ndb.isostandards DROP CONSTRAINT IF EXISTS isostandards_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isostandards ADD CONSTRAINT isostandards_pkey PRIMARY KEY (datasetid, variableid, isostandardid);

--- Foreign Key Restraints
ALTER TABLE ndb.isostandards ADD CONSTRAINT fk_isostandards_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isostandards ADD CONSTRAINT fk_isostandards_variables FOREIGN KEY (variableid) REFERENCES ndb.variables(variableid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isostandards ADD CONSTRAINT fk_isostandards_isostandardtypes FOREIGN KEY (isostandardid) REFERENCES ndb.isostandardtypes(isostandardtypeid) ON UPDATE CASCADE ON DELETE CASCADE;