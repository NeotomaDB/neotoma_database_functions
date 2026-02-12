-- ndb.sampleanalysts Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.sampleanalysts

CREATE TABLE IF NOT EXISTS ndb.sampleanalysts (

    analystid integer DEFAULT nextval('ndb.seq_sampleanalysts_analystid'::regclass) NOT NULL,
    sampleid integer NOT NULL,
    contactid integer NOT NULL,
    analystorder integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.sampleanalysts IS 'This table lists the Sample Analysts.';
COMMENT ON COLUMN ndb.sampleanalysts.analystid IS 'An arbitrary Sample Analyst identification number.';
COMMENT ON COLUMN ndb.sampleanalysts.sampleid IS 'Sample identification number. Field links to the Samples table.';
COMMENT ON COLUMN ndb.sampleanalysts.contactid IS 'Contact identification number. Field links to the Contacts table.';
COMMENT ON COLUMN ndb.sampleanalysts.analystorder IS 'Order in which Sample Analysts are listed if more than one (rare).';
COMMENT ON COLUMN ndb.sampleanalysts.recdatecreated IS '';
COMMENT ON COLUMN ndb.sampleanalysts.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX sampleanalysts_pkey ON ndb.sampleanalysts USING btree (analystid);
CREATE INDEX ix_contactid_sampleanalysts ON ndb.sampleanalysts USING btree (contactid) WITH (fillfactor='10');
CREATE INDEX ix_sampleid_sampleanalysts ON ndb.sampleanalysts USING btree (sampleid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.sampleanalysts DROP CONSTRAINT IF EXISTS sampleanalysts_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.sampleanalysts ADD CONSTRAINT sampleanalysts_pkey PRIMARY KEY (analystid);

--- Foreign Key Restraints
ALTER TABLE ndb.sampleanalysts ADD CONSTRAINT fk_sampleanalysts_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.sampleanalysts ADD CONSTRAINT fk_sampleanalysts_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.sampleanalysts;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.sampleanalysts;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.sampleanalysts FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.sampleanalysts FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n