-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.specimendomesticstatustypes

CREATE TABLE IF NOT EXISTS ndb.specimendomesticstatustypes (

    domesticstatusid integer DEFAULT nextval('ndb.seq_specimendomesticstatustypes_domesticstatusid'::regclass) NOT NULL,
    domesticstatus character varying(24) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.specimendomesticstatustypes IS "";

--- Table indices
CREATE UNIQUE INDEX specimendomesticstatustypes_pkey ON ndb.specimendomesticstatustypes USING btree (domesticstatusid)

--- Remove existing constraints if needed
ALTER TABLE ndb.specimendomesticstatustypes DROP CONSTRAINT IF EXISTS specimendomesticstatustypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.specimendomesticstatustypes ADD CONSTRAINT specimendomesticstatustypes_pkey PRIMARY KEY (domesticstatusid);

--- Foreign Key Restraints