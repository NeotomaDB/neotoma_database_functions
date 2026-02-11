-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.specimensextypes

CREATE TABLE IF NOT EXISTS ndb.specimensextypes (

    sexid integer DEFAULT nextval('ndb.seq_specimensextypes_sexid'::regclass) NOT NULL,
    sex character varying(24) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.specimensextypes IS "";

--- Table indices
CREATE UNIQUE INDEX specimensextypes_pkey ON ndb.specimensextypes USING btree (sexid)

--- Remove existing constraints if needed
ALTER TABLE ndb.specimensextypes DROP CONSTRAINT IF EXISTS specimensextypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.specimensextypes ADD CONSTRAINT specimensextypes_pkey PRIMARY KEY (sexid);

--- Foreign Key Restraints