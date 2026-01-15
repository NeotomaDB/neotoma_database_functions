-- taxaalthierarchy definition

-- Drop table

-- DROP TABLE IF EXISTS taxaalthierarchy.taxaalthierarchy

CREATE TABLE taxaalthierarchy.taxaalthierarchy (
    taxaalthierarchytypeid integer NOT NULL,
    taxonid integer NOT NULL,
    highertaxonid integer NOT NULL,
    CONSTRAINT taxaalthierarchy_pkey PRIMARY KEY (taxaalthierarchytypeid, taxonid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.taxaalthierarchy ADD CONSTRAINT fk_taxaalthierarchy_taxa1 FOREIGN KEY (highertaxonid) REFERENCES ndb.taxa(taxonid);
ALTER TABLE ndb.taxaalthierarchy ADD CONSTRAINT fk_taxaalthierarchy_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.taxaalthierarchy ADD CONSTRAINT fk_taxaalthierarchy_taxaalthierarchytypes FOREIGN KEY (taxaalthierarchytypeid) REFERENCES ndb.taxaalthierarchytypes(taxaalthierarchytypeid) ON UPDATE CASCADE ON DELETE CASCADE;