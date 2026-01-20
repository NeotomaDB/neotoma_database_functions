-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.dataprocessors

CREATE TABLE IF NOT EXISTS ndb.dataprocessors (

    datasetid integer NOT NULL,
    contactid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.dataprocessors IS "";

--- Table indices
CREATE UNIQUE INDEX dataprocessors_pkey ON ndb.dataprocessors USING btree (datasetid, contactid)

--- Remove existing constraints if needed
ALTER TABLE ndb.dataprocessors DROP CONSTRAINT IF EXISTS dataprocessors_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.dataprocessors ADD CONSTRAINT dataprocessors_pkey PRIMARY KEY (datasetid, contactid);

--- Foreign Key Restraints
ALTER TABLE ndb.dataprocessors ADD CONSTRAINT fk_dataprocessors_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.dataprocessors ADD CONSTRAINT fk_dataprocessors_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;