-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.publicationtypes

CREATE TABLE IF NOT EXISTS ndb.publicationtypes (

    pubtypeid integer DEFAULT nextval('ndb.seq_publicationtypes_pubtypeid'::regclass) NOT NULL,
    pubtype character varying(24) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.publicationtypes IS "Lookup table of Publication Types. This table is referenced by the Publications table.";

--- Table indices
CREATE UNIQUE INDEX publicationtypes_pkey ON ndb.publicationtypes USING btree (pubtypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.publicationtypes DROP CONSTRAINT IF EXISTS publicationtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.publicationtypes ADD CONSTRAINT publicationtypes_pkey PRIMARY KEY (pubtypeid);

--- Foreign Key Restraints