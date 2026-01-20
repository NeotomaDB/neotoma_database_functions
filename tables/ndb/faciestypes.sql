-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.faciestypes

CREATE TABLE IF NOT EXISTS ndb.faciestypes (

    faciesid integer DEFAULT nextval('ndb.seq_faciestypes_faciesid'::regclass) NOT NULL,
    facies character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.faciestypes IS "Lookup table of Facies Types. Table is referenced by the AnalysisUnits table.";

--- Table indices
CREATE UNIQUE INDEX faciestypes_pkey ON ndb.faciestypes USING btree (faciesid)

--- Remove existing constraints if needed
ALTER TABLE ndb.faciestypes DROP CONSTRAINT IF EXISTS faciestypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.faciestypes ADD CONSTRAINT faciestypes_pkey PRIMARY KEY (faciesid);

--- Foreign Key Restraints