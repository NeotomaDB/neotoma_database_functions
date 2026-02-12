-- ndb.synonymy Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.synonymy

CREATE TABLE IF NOT EXISTS ndb.synonymy (

    synonymyid integer DEFAULT nextval('ndb.seq_synonymy_synonymyid'::regclass) NOT NULL,
    datasetid integer NOT NULL,
    taxonid integer NOT NULL,
    reftaxonid integer NOT NULL,
    fromcontributor boolean NULL,
    publicationid integer NULL,
    notes text NULL,
    contactid integer NULL,
    datesynonymized date NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.synonymy IS 'The synonymy table links dataset-level synonymies to particular publications or contacts.  This allows users to maintain the original taxonomic information within a table, but tie it to newer and more authoritative taxonomic information.';
COMMENT ON COLUMN ndb.synonymy.synonymyid IS '';
COMMENT ON COLUMN ndb.synonymy.datasetid IS 'DatasetID from the Datasets table';
COMMENT ON COLUMN ndb.synonymy.taxonid IS '';
COMMENT ON COLUMN ndb.synonymy.reftaxonid IS '';
COMMENT ON COLUMN ndb.synonymy.fromcontributor IS '';
COMMENT ON COLUMN ndb.synonymy.publicationid IS '';
COMMENT ON COLUMN ndb.synonymy.notes IS '';
COMMENT ON COLUMN ndb.synonymy.contactid IS '';
COMMENT ON COLUMN ndb.synonymy.datesynonymized IS '';
COMMENT ON COLUMN ndb.synonymy.recdatecreated IS '';
COMMENT ON COLUMN ndb.synonymy.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX synonymy_pkey ON ndb.synonymy USING btree (synonymyid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.synonymy DROP CONSTRAINT IF EXISTS synonymy_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.synonymy ADD CONSTRAINT synonymy_pkey PRIMARY KEY (synonymyid);

--- Foreign Key Restraints
ALTER TABLE ndb.synonymy ADD CONSTRAINT fk_synonymy_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.synonymy ADD CONSTRAINT fk_synonymy_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);
ALTER TABLE ndb.synonymy ADD CONSTRAINT fk_synonymy_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.synonymy ADD CONSTRAINT fk_synonymy_taxa1 FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.synonymy ADD CONSTRAINT fk_synonymy_taxa2 FOREIGN KEY (reftaxonid) REFERENCES ndb.taxa(taxonid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.synonymy;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.synonymy;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.synonymy FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.synonymy FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n