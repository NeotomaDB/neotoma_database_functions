-- ndb.synonyms Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.synonyms

CREATE TABLE IF NOT EXISTS ndb.synonyms (

    synonymid integer DEFAULT nextval('ndb.seq_synonyms_synonymid'::regclass) NOT NULL,
    invalidtaxonid integer NOT NULL,
    validtaxonid integer NOT NULL,
    synonymtypeid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.synonyms IS 'This table lists common synonyms for taxa in the Taxa table. No effort has been made to provide a complete taxonomic synonymy, but rather to list synonyms commonly used in recent literature.  This table is not the same as the Synonomy table, also present in Neotoma, which links a specific synonymy to a dataset';
COMMENT ON COLUMN ndb.synonyms.synonymid IS 'An arbitrary synonym identification number.';
COMMENT ON COLUMN ndb.synonyms.invalidtaxonid IS '';
COMMENT ON COLUMN ndb.synonyms.validtaxonid IS '';
COMMENT ON COLUMN ndb.synonyms.synonymtypeid IS 'Type of synonym. Field links to the SynonymTypes lookup table.';
COMMENT ON COLUMN ndb.synonyms.recdatecreated IS '';
COMMENT ON COLUMN ndb.synonyms.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX synonyms_pkey ON ndb.synonyms USING btree (synonymid);
CREATE INDEX ix_taxonid_synonyms ON ndb.synonyms USING btree (validtaxonid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.synonyms DROP CONSTRAINT IF EXISTS synonyms_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.synonyms ADD CONSTRAINT synonyms_pkey PRIMARY KEY (synonymid);

--- Foreign Key Restraints
ALTER TABLE ndb.synonyms ADD CONSTRAINT fk_synonyms_synonymtypes FOREIGN KEY (synonymtypeid) REFERENCES ndb.synonymtypes(synonymtypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.synonyms ADD CONSTRAINT fk_synonyms_invalidtaxa FOREIGN KEY (invalidtaxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.synonyms ADD CONSTRAINT fk_synonyms_validtaxa FOREIGN KEY (validtaxonid) REFERENCES ndb.taxa(taxonid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.synonyms;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.synonyms;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.synonyms FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.synonyms FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n