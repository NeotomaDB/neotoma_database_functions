-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.chroncontrolprecisionranks

CREATE TABLE IF NOT EXISTS ndb.chroncontrolprecisionranks (

    precisionrankid integer DEFAULT nextval('ndb.seq_chroncontrolprecisionranks_precisionrankid'::regclass) NOT NULL,
    precisionrank character varying(255) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.chroncontrolprecisionranks IS "";

--- Table indices
CREATE UNIQUE INDEX chroncontrolprecisionranks_pkey ON ndb.chroncontrolprecisionranks USING btree (precisionrankid)

--- Remove existing constraints if needed
ALTER TABLE ndb.chroncontrolprecisionranks DROP CONSTRAINT IF EXISTS chroncontrolprecisionranks_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.chroncontrolprecisionranks ADD CONSTRAINT chroncontrolprecisionranks_pkey PRIMARY KEY (precisionrankid);

--- Foreign Key Restraints