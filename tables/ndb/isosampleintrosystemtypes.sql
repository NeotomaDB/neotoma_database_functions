-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isosampleintrosystemtypes

CREATE TABLE IF NOT EXISTS ndb.isosampleintrosystemtypes (

    isosampleintrosystemtypeid integer DEFAULT nextval('ndb.seq_isosampleintrosystemtypes_isosampleintrosystemtypeid'::regclass) NOT NULL,
    isosampleintrosystemtype character varying(256) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.isosampleintrosystemtypes IS "";

--- Table indices
CREATE UNIQUE INDEX isosampleintrosystemtypes_pkey ON ndb.isosampleintrosystemtypes USING btree (isosampleintrosystemtypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.isosampleintrosystemtypes DROP CONSTRAINT IF EXISTS isosampleintrosystemtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isosampleintrosystemtypes ADD CONSTRAINT isosampleintrosystemtypes_pkey PRIMARY KEY (isosampleintrosystemtypeid);

--- Foreign Key Restraints