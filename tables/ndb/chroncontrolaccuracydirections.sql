-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.chroncontrolaccuracydirections

CREATE TABLE IF NOT EXISTS ndb.chroncontrolaccuracydirections (

    accuracydirectionid integer DEFAULT nextval('ndb.seq_chroncontrolaccuracydirections_accuracydirectionid'::regclass) NOT NULL,
    accuracydirection character varying(80) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.chroncontrolaccuracydirections IS "";

--- Table indices
CREATE UNIQUE INDEX chroncontrolaccuracydirections_pkey ON ndb.chroncontrolaccuracydirections USING btree (accuracydirectionid)

--- Remove existing constraints if needed
ALTER TABLE ndb.chroncontrolaccuracydirections DROP CONSTRAINT IF EXISTS chroncontrolaccuracydirections_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.chroncontrolaccuracydirections ADD CONSTRAINT chroncontrolaccuracydirections_pkey PRIMARY KEY (accuracydirectionid);

--- Foreign Key Restraints