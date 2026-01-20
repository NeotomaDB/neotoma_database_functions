-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasettypes

CREATE TABLE IF NOT EXISTS ndb.datasettypes (

    datasettypeid integer DEFAULT nextval('ndb.seq_datasettypes_datasettypeid'::regclass) NOT NULL,
    datasettype character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.datasettypes IS "Lookup table for Dataset Types. Table is referenced by the Datasets table.";

--- Table indices
CREATE UNIQUE INDEX datasettypes_pkey ON ndb.datasettypes USING btree (datasettypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.datasettypes DROP CONSTRAINT IF EXISTS datasettypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datasettypes ADD CONSTRAINT datasettypes_pkey PRIMARY KEY (datasettypeid);

--- Foreign Key Restraints