-- ndb.taxonpaths Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.taxonpaths

CREATE TABLE IF NOT EXISTS ndb.taxonpaths (

    taxonout integer[] NOT NULL,
    taxonid bigint NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.taxonpaths IS "";

--- Table indices
CREATE UNIQUE INDEX taxonpaths_pkey ON ndb.taxonpaths USING btree (taxonout, taxonid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.taxonpaths DROP CONSTRAINT IF EXISTS taxonpaths_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.taxonpaths ADD CONSTRAINT taxonpaths_pkey PRIMARY KEY (taxonout, taxonid);

--- Foreign Key Restraints
ALTER TABLE ndb.taxonpaths ADD CONSTRAINT taxonpaths_taxonid_fkey FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON DELETE CASCADE;

--- Triggers