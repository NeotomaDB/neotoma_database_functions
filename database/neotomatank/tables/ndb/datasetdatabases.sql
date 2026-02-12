-- ndb.datasetdatabases Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasetdatabases

CREATE TABLE IF NOT EXISTS ndb.datasetdatabases (

    datasetid integer NOT NULL,
    databaseid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.datasetdatabases IS '';
COMMENT ON COLUMN ndb.datasetdatabases.datasetid IS '';
COMMENT ON COLUMN ndb.datasetdatabases.databaseid IS '';
COMMENT ON COLUMN ndb.datasetdatabases.recdatecreated IS '';
COMMENT ON COLUMN ndb.datasetdatabases.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX datasetdatabases_pkey ON ndb.datasetdatabases USING btree (datasetid, databaseid);
CREATE INDEX ix_datasetid_datasetdatabases ON ndb.datasetdatabases USING btree (datasetid) WITH (fillfactor='10');
CREATE INDEX ix_projectid_datasetdatabases ON ndb.datasetdatabases USING btree (databaseid) WITH (fillfactor='10');
CREATE INDEX datasettimes ON ndb.datasetdatabases USING btree (recdatecreated)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.datasetdatabases DROP CONSTRAINT IF EXISTS datasetdatabases_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datasetdatabases ADD CONSTRAINT datasetdatabases_pkey PRIMARY KEY (datasetid, databaseid);

--- Foreign Key Restraints
ALTER TABLE ndb.datasetdatabases ADD CONSTRAINT fk_datasetdatabases_constituentdatabases FOREIGN KEY (databaseid) REFERENCES ndb.constituentdatabases(databaseid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasetdatabases ADD CONSTRAINT fk_datasetdatabases_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasetdatabases;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasetdatabases;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.datasetdatabases FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.datasetdatabases FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n