-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.synonymtypes

CREATE TABLE IF NOT EXISTS ndb.synonymtypes (

    synonymtypeid integer DEFAULT nextval('ndb.seq_synonymtypes_synonymtypeid'::regclass) NOT NULL,
    synonymtype character varying(255) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.synonymtypes IS "Lookup table of Synonym Types. Table is referenced by the Synonyms table.";

--- Table indices
CREATE UNIQUE INDEX synonymtypes_pkey ON ndb.synonymtypes USING btree (synonymtypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.synonymtypes DROP CONSTRAINT IF EXISTS synonymtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.synonymtypes ADD CONSTRAINT synonymtypes_pkey PRIMARY KEY (synonymtypeid);

--- Foreign Key Restraints