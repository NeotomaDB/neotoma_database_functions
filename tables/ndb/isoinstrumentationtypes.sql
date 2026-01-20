-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isoinstrumentationtypes

CREATE TABLE IF NOT EXISTS ndb.isoinstrumentationtypes (

    isoinstrumentationtypeid integer DEFAULT nextval('ndb.seq_isoinstrumentationtypes_isoinstrumentationtypeid'::regclass) NOT NULL,
    isoinstrumentationtype character varying(256) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.isoinstrumentationtypes IS "";

--- Table indices
CREATE UNIQUE INDEX isoinstrumentationtypes_pkey ON ndb.isoinstrumentationtypes USING btree (isoinstrumentationtypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.isoinstrumentationtypes DROP CONSTRAINT IF EXISTS isoinstrumentationtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isoinstrumentationtypes ADD CONSTRAINT isoinstrumentationtypes_pkey PRIMARY KEY (isoinstrumentationtypeid);

--- Foreign Key Restraints