-- ndb.taxaalthierarchy Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.taxaalthierarchy

CREATE TABLE IF NOT EXISTS ndb.taxaalthierarchy (

    taxaalthierarchytypeid integer NOT NULL,
    taxonid integer NOT NULL,
    highertaxonid integer NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.taxaalthierarchy IS '';
COMMENT ON COLUMN ndb.taxaalthierarchy.taxaalthierarchytypeid IS '';
COMMENT ON COLUMN ndb.taxaalthierarchy.taxonid IS '';
COMMENT ON COLUMN ndb.taxaalthierarchy.highertaxonid IS '';

--- Table indices
CREATE UNIQUE INDEX taxaalthierarchy_pkey ON ndb.taxaalthierarchy USING btree (taxaalthierarchytypeid, taxonid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.taxaalthierarchy DROP CONSTRAINT IF EXISTS taxaalthierarchy_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.taxaalthierarchy ADD CONSTRAINT taxaalthierarchy_pkey PRIMARY KEY (taxaalthierarchytypeid, taxonid);

--- Foreign Key Restraints
ALTER TABLE ndb.taxaalthierarchy ADD CONSTRAINT fk_taxaalthierarchy_taxa1 FOREIGN KEY (highertaxonid) REFERENCES ndb.taxa(taxonid);
ALTER TABLE ndb.taxaalthierarchy ADD CONSTRAINT fk_taxaalthierarchy_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.taxaalthierarchy ADD CONSTRAINT fk_taxaalthierarchy_taxaalthierarchytypes FOREIGN KEY (taxaalthierarchytypeid) REFERENCES ndb.taxaalthierarchytypes(taxaalthierarchytypeid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers