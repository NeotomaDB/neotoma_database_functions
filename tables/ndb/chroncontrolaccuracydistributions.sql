-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.chroncontrolaccuracydistributions

CREATE TABLE IF NOT EXISTS ndb.chroncontrolaccuracydistributions (

    accuracydistributionid integer DEFAULT nextval('ndb.seq_chroncontrolaccuracydistributions_accuracydistributionid'::regclass) NOT NULL,
    accuracydistribution character varying(40) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.chroncontrolaccuracydistributions IS "";

--- Table indices
CREATE UNIQUE INDEX chroncontrolaccuracydistributions_pkey ON ndb.chroncontrolaccuracydistributions USING btree (accuracydistributionid)

--- Remove existing constraints if needed
ALTER TABLE ndb.chroncontrolaccuracydistributions DROP CONSTRAINT IF EXISTS chroncontrolaccuracydistributions_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.chroncontrolaccuracydistributions ADD CONSTRAINT chroncontrolaccuracydistributions_pkey PRIMARY KEY (accuracydistributionid);

--- Foreign Key Restraints