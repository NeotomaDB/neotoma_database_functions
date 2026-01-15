-- taxonpaths definition

-- Drop table

-- DROP TABLE IF EXISTS taxonpaths.taxonpaths

CREATE TABLE taxonpaths.taxonpaths (
    taxonout integer[] NOT NULL,
    taxonid bigint NOT NULL,
    CONSTRAINT taxonpaths_pkey PRIMARY KEY (taxonout, taxonid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.taxonpaths ADD CONSTRAINT taxonpaths_taxonid_fkey FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON DELETE CASCADE;