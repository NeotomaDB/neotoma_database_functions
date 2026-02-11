-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.geochrontypes

CREATE TABLE IF NOT EXISTS ndb.geochrontypes (

    geochrontypeid integer DEFAULT nextval('ndb.seq_geochrontypes_geochrontypeid'::regclass) NOT NULL,
    geochrontype character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.geochrontypes IS "Lookup table for Geochronology Types. Table is referenced by the Geochronology table.";

--- Table indices
CREATE UNIQUE INDEX geochrontypes_pkey ON ndb.geochrontypes USING btree (geochrontypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.geochrontypes DROP CONSTRAINT IF EXISTS geochrontypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.geochrontypes ADD CONSTRAINT geochrontypes_pkey PRIMARY KEY (geochrontypeid);

--- Foreign Key Restraints