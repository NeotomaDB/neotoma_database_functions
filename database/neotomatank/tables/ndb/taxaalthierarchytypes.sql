-- ndb.taxaalthierarchytypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.taxaalthierarchytypes

CREATE TABLE IF NOT EXISTS ndb.taxaalthierarchytypes (

    taxaalthierarchytypeid integer DEFAULT nextval('ndb.seq_taxaalthierarchytypes_taxaalthierarchytypeid'::regclass) NOT NULL,
    taxaalthierarchyname character varying(50) NOT NULL,
    taxaalthierarchydescript text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.taxaalthierarchytypes IS "";

--- Table indices
CREATE UNIQUE INDEX taxaalthierarchytypes_pkey ON ndb.taxaalthierarchytypes USING btree (taxaalthierarchytypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.taxaalthierarchytypes DROP CONSTRAINT IF EXISTS taxaalthierarchytypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.taxaalthierarchytypes ADD CONSTRAINT taxaalthierarchytypes_pkey PRIMARY KEY (taxaalthierarchytypeid);

--- Foreign Key Restraints

--- Triggers