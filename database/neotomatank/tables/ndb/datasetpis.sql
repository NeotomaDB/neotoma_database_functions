-- ndb.datasetpis Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasetpis

CREATE TABLE IF NOT EXISTS ndb.datasetpis (

    datasetid integer NOT NULL,
    contactid integer NOT NULL,
    piorder integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.datasetpis IS '';
COMMENT ON COLUMN ndb.datasetpis.datasetid IS 'Dataset identification number. Field links to Dataset table.';
COMMENT ON COLUMN ndb.datasetpis.contactid IS 'Contact identification number. Field links to Contacts table.';
COMMENT ON COLUMN ndb.datasetpis.piorder IS 'Order in which PIs are listed.';
COMMENT ON COLUMN ndb.datasetpis.recdatecreated IS '';
COMMENT ON COLUMN ndb.datasetpis.recdatemodified IS '';

--- Table indices
CREATE INDEX ix_contactid_datasetpis ON ndb.datasetpis USING btree (contactid) WITH (fillfactor='10');
CREATE INDEX ix_datasetid_datasetpis ON ndb.datasetpis USING btree (datasetid) WITH (fillfactor='10');
CREATE INDEX idx_datasetpis_datasetid ON ndb.datasetpis USING btree (datasetid);
CREATE INDEX idx_datasetpis_datasetid_contactid ON ndb.datasetpis USING btree (datasetid) INCLUDE (contactid)

--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.datasetpis ADD CONSTRAINT fk_datasetpis_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;
ALTER TABLE ndb.datasetpis ADD CONSTRAINT fk_datasetpis_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasetpis;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasetpis;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.datasetpis FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.datasetpis FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n