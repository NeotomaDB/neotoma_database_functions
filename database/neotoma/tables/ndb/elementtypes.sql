-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.elementtypes

CREATE TABLE IF NOT EXISTS ndb.elementtypes (

    elementtypeid integer DEFAULT nextval('ndb.seq_elementtypes_elementtypeid'::regclass) NOT NULL,
    elementtype character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.elementtypes IS "";

--- Table indices
CREATE UNIQUE INDEX elementtypes_pkey ON ndb.elementtypes USING btree (elementtypeid);
CREATE UNIQUE INDEX ix_elementtypes ON ndb.elementtypes USING btree (elementtype) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.elementtypes DROP CONSTRAINT IF EXISTS elementtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.elementtypes ADD CONSTRAINT elementtypes_pkey PRIMARY KEY (elementtypeid);

--- Foreign Key Restraints