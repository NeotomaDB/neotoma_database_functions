-- ndb.specimendates Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.specimendates

CREATE TABLE IF NOT EXISTS ndb.specimendates (

    specimendateid integer DEFAULT nextval('ndb.seq_specimendates_specimendateid'::regclass) NOT NULL,
    geochronid integer NOT NULL,
    taxonid integer NOT NULL,
    fractionid integer NULL,
    sampleid integer NOT NULL,
    notes text NULL,
    elementtypeid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    specimenid integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.specimendates IS 'This table enables queries for dated specimens of individual taxa. Although the MaterialDated field in the Geochronology table may list the taxa dated, this protocol is not enforced, and the field is not linked to the taxa table.';
COMMENT ON COLUMN ndb.specimendates.specimendateid IS 'An arbitrary specimen date ID';
COMMENT ON COLUMN ndb.specimendates.geochronid IS 'Geochronologic identification number. Field links to the Geochronology table.';
COMMENT ON COLUMN ndb.specimendates.taxonid IS 'Accepted name in Neotoma. Field links to Taxa table.';
COMMENT ON COLUMN ndb.specimendates.fractionid IS '';
COMMENT ON COLUMN ndb.specimendates.sampleid IS 'Sample ID number. Field links to the Samples table.';
COMMENT ON COLUMN ndb.specimendates.notes IS 'Free form notes or comments about dated specimens.';
COMMENT ON COLUMN ndb.specimendates.elementtypeid IS '';
COMMENT ON COLUMN ndb.specimendates.recdatecreated IS '';
COMMENT ON COLUMN ndb.specimendates.recdatemodified IS '';
COMMENT ON COLUMN ndb.specimendates.specimenid IS '';

--- Table indices
CREATE UNIQUE INDEX specimendates_pkey ON ndb.specimendates USING btree (specimendateid);
CREATE INDEX ix_sampleid_specimendates ON ndb.specimendates USING btree (sampleid) WITH (fillfactor='10');
CREATE INDEX ix_taxonid_specimendates ON ndb.specimendates USING btree (taxonid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.specimendates DROP CONSTRAINT IF EXISTS specimendates_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.specimendates ADD CONSTRAINT specimendates_pkey PRIMARY KEY (specimendateid);

--- Foreign Key Restraints
ALTER TABLE ndb.specimendates ADD CONSTRAINT sd_smpid FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.specimendates ADD CONSTRAINT fk_specimendates_specimens FOREIGN KEY (specimenid) REFERENCES ndb.specimens(specimenid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.specimendates ADD CONSTRAINT sd_etyid FOREIGN KEY (elementtypeid) REFERENCES ndb.elementtypes(elementtypeid);
ALTER TABLE ndb.specimendates ADD CONSTRAINT sd_fcid FOREIGN KEY (fractionid) REFERENCES ndb.fractiondated(fractionid);
ALTER TABLE ndb.specimendates ADD CONSTRAINT sd_txid FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid);
ALTER TABLE ndb.specimendates ADD CONSTRAINT sd_gcid FOREIGN KEY (geochronid) REFERENCES ndb.geochronology(geochronid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.specimendates;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.specimendates;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.specimendates FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.specimendates FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n