-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isomaterialanalyzedtypes

CREATE TABLE IF NOT EXISTS ndb.isomaterialanalyzedtypes (

    isomatanaltypeid integer DEFAULT nextval('ndb.seq_isomaterialanalyzedtypes_isomatanaltypeid'::regclass) NOT NULL,
    isomaterialanalyzedtype character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.isomaterialanalyzedtypes IS "";

--- Table indices
CREATE UNIQUE INDEX isomaterialanalyzedtypes_pkey ON ndb.isomaterialanalyzedtypes USING btree (isomatanaltypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.isomaterialanalyzedtypes DROP CONSTRAINT IF EXISTS isomaterialanalyzedtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isomaterialanalyzedtypes ADD CONSTRAINT isomaterialanalyzedtypes_pkey PRIMARY KEY (isomatanaltypeid);

--- Foreign Key Restraints