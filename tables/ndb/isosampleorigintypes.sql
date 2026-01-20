-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isosampleorigintypes

CREATE TABLE IF NOT EXISTS ndb.isosampleorigintypes (

    isosampleorigintypeid integer DEFAULT nextval('ndb.seq_isosampleorigintypes_isosampleorigintypeid'::regclass) NOT NULL,
    isosampleorigintype character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.isosampleorigintypes IS "";

--- Table indices
CREATE UNIQUE INDEX isosampleorigintypes_pkey ON ndb.isosampleorigintypes USING btree (isosampleorigintypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.isosampleorigintypes DROP CONSTRAINT IF EXISTS isosampleorigintypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isosampleorigintypes ADD CONSTRAINT isosampleorigintypes_pkey PRIMARY KEY (isosampleorigintypeid);

--- Foreign Key Restraints