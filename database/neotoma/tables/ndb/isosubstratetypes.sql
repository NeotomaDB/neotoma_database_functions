-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isosubstratetypes

CREATE TABLE IF NOT EXISTS ndb.isosubstratetypes (

    isosubstratetypeid integer DEFAULT nextval('ndb.seq_isosubstratetypes_isosubstratetypeid'::regclass) NOT NULL,
    isosubstratetype character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.isosubstratetypes IS "";

--- Table indices
CREATE UNIQUE INDEX isosubstratetypes_pkey ON ndb.isosubstratetypes USING btree (isosubstratetypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.isosubstratetypes DROP CONSTRAINT IF EXISTS isosubstratetypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isosubstratetypes ADD CONSTRAINT isosubstratetypes_pkey PRIMARY KEY (isosubstratetypeid);

--- Foreign Key Restraints