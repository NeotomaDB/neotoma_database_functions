-- ndb.datasetpublications Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasetpublications

CREATE TABLE IF NOT EXISTS ndb.datasetpublications (

    datasetid integer NOT NULL,
    publicationid integer NOT NULL,
    primarypub boolean NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.datasetpublications IS 'This table lists the publications for datasets.';
COMMENT ON COLUMN ndb.datasetpublications.datasetid IS 'Dataset identification number. Field links to Dataset table.';
COMMENT ON COLUMN ndb.datasetpublications.publicationid IS 'Publication identification number. Field links to Publications table.';
COMMENT ON COLUMN ndb.datasetpublications.primarypub IS 'Is «True» if the publication is the primary publication for the dataset.';
COMMENT ON COLUMN ndb.datasetpublications.recdatecreated IS '';
COMMENT ON COLUMN ndb.datasetpublications.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX datasetpublications_pkey ON ndb.datasetpublications USING btree (datasetid, publicationid);
CREATE INDEX ix_datasetid_datasetpublications ON ndb.datasetpublications USING btree (datasetid) WITH (fillfactor='10');
CREATE INDEX ix_publicationid_datasetpublications ON ndb.datasetpublications USING btree (publicationid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.datasetpublications DROP CONSTRAINT IF EXISTS datasetpublications_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datasetpublications ADD CONSTRAINT datasetpublications_pkey PRIMARY KEY (datasetid, publicationid);

--- Foreign Key Restraints
ALTER TABLE ndb.datasetpublications ADD CONSTRAINT fk_datasetpublications_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid);
ALTER TABLE ndb.datasetpublications ADD CONSTRAINT fk_datasetpublications_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasetpublications;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasetpublications;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.datasetpublications FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.datasetpublications FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n