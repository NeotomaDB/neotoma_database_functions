-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.agetypes

CREATE TABLE IF NOT EXISTS ndb.agetypes (

    agetypeid integer DEFAULT nextval('ndb.seq_agetypes_agetypeid'::regclass) NOT NULL,
    agetype character varying(64) NOT NULL,
    precedence integer NULL,
    shortagetype character varying(32) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.agetypes IS "Lookup table of Age Types or units. This table is referenced by the Chronologies and Geochronology tables.";

--- Table indices
CREATE UNIQUE INDEX agetypes_pkey ON ndb.agetypes USING btree (agetypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.agetypes DROP CONSTRAINT IF EXISTS agetypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.agetypes ADD CONSTRAINT agetypes_pkey PRIMARY KEY (agetypeid);

--- Foreign Key Restraints