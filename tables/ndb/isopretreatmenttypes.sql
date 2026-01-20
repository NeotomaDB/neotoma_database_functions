-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isopretreatmenttypes

CREATE TABLE IF NOT EXISTS ndb.isopretreatmenttypes (

    isopretreatmenttypeid integer DEFAULT nextval('ndb.seq_isopretreatmenttypes_isopretreatmenttypeid'::regclass) NOT NULL,
    isopretreatmenttype character varying(50) NOT NULL,
    isopretreatmentqualifier character varying(50) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.isopretreatmenttypes IS "";

--- Table indices
CREATE UNIQUE INDEX isopretreatmenttypes_pkey ON ndb.isopretreatmenttypes USING btree (isopretreatmenttypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.isopretreatmenttypes DROP CONSTRAINT IF EXISTS isopretreatmenttypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isopretreatmenttypes ADD CONSTRAINT isopretreatmenttypes_pkey PRIMARY KEY (isopretreatmenttypeid);

--- Foreign Key Restraints