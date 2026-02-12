-- ndb.datasets Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasets

CREATE TABLE IF NOT EXISTS ndb.datasets (

    datasetid integer DEFAULT nextval('ndb.seq_datasets_datasetid'::regclass) NOT NULL,
    collectionunitid integer NOT NULL,
    datasettypeid integer NOT NULL,
    datasetname character varying(80) NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    embargoid integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.datasets IS 'This table stores the data for Datasets. A Dataset is the set of samples for a particular data type from a Collection Unit. A Collection Unit may have multiple Datasets for different data types, for example one dataset for pollen and another for plant macrofossils. Every Sample is assigned to a Dataset, and every Dataset is assigned to a Collection Unit. Samples from different Collection Units cannot be assigned to the same Dataset (although they may be assigned to Aggregate Datasets).';
COMMENT ON COLUMN ndb.datasets.datasetid IS 'An arbitrary Dataset identification number.';
COMMENT ON COLUMN ndb.datasets.collectionunitid IS 'Collection Unit identification number. Field links to the CollectionUnits table.';
COMMENT ON COLUMN ndb.datasets.datasettypeid IS 'Dataset Type identification number. Field links to the DatasetTypes lookup table.';
COMMENT ON COLUMN ndb.datasets.datasetname IS 'Optional name for the Dataset.';
COMMENT ON COLUMN ndb.datasets.notes IS 'Free form notes or comments about the Dataset.';
COMMENT ON COLUMN ndb.datasets.recdatecreated IS '';
COMMENT ON COLUMN ndb.datasets.recdatemodified IS '';
COMMENT ON COLUMN ndb.datasets.embargoid IS '';

--- Table indices
CREATE UNIQUE INDEX datasets_pkey ON ndb.datasets USING btree (datasetid);
CREATE INDEX ix_collectionunitid_datasets ON ndb.datasets USING btree (collectionunitid) WITH (fillfactor='10');
CREATE INDEX ix_datasettypeid_datasets ON ndb.datasets USING btree (datasettypeid) WITH (fillfactor='10');
CREATE INDEX idx_datasets_collectionunit ON ndb.datasets USING btree (collectionunitid) INCLUDE (datasetid, datasettypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.datasets DROP CONSTRAINT IF EXISTS datasets_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datasets ADD CONSTRAINT datasets_pkey PRIMARY KEY (datasetid);

--- Foreign Key Restraints
ALTER TABLE ndb.datasets ADD CONSTRAINT fk_datasets_datasettypes FOREIGN KEY (datasettypeid) REFERENCES ndb.datasettypes(datasettypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasets ADD CONSTRAINT fk_datasets_collectionunits FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasets ADD CONSTRAINT fk_datasets_embargo FOREIGN KEY (embargoid) REFERENCES ndb.embargo(embargoid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasets;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasets;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.datasets FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.datasets FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n