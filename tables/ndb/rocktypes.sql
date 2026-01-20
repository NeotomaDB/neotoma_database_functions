-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.rocktypes

CREATE TABLE IF NOT EXISTS ndb.rocktypes (

    rocktypeid integer DEFAULT nextval('ndb.seq_rocktypes_rocktypeid'::regclass) NOT NULL,
    rocktype character varying(64) NOT NULL,
    higherrocktypeid integer NOT NULL,
    description text NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.rocktypes IS "";

--- Table indices
CREATE UNIQUE INDEX rocktypes_pkey ON ndb.rocktypes USING btree (rocktypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.rocktypes DROP CONSTRAINT IF EXISTS rocktypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.rocktypes ADD CONSTRAINT rocktypes_pkey PRIMARY KEY (rocktypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.rocktypes ADD CONSTRAINT fk_higherrocktypeid FOREIGN KEY (higherrocktypeid) REFERENCES ndb.rocktypes(rocktypeid);