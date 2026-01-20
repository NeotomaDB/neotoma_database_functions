-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.chroncontrolaccuracyranks

CREATE TABLE IF NOT EXISTS ndb.chroncontrolaccuracyranks (

    accuracyrankid integer DEFAULT nextval('ndb.seq_chroncontrolaccuracyranks_accuracyrankid'::regclass) NOT NULL,
    accuracyrank character varying(255) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.chroncontrolaccuracyranks IS "";

--- Table indices
CREATE UNIQUE INDEX chroncontrolaccuracyranks_pkey ON ndb.chroncontrolaccuracyranks USING btree (accuracyrankid)

--- Remove existing constraints if needed
ALTER TABLE ndb.chroncontrolaccuracyranks DROP CONSTRAINT IF EXISTS chroncontrolaccuracyranks_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.chroncontrolaccuracyranks ADD CONSTRAINT chroncontrolaccuracyranks_pkey PRIMARY KEY (accuracyrankid);

--- Foreign Key Restraints