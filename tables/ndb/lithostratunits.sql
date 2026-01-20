-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.lithostratunits

CREATE TABLE IF NOT EXISTS ndb.lithostratunits (

    lithostratunitid integer DEFAULT nextval('ndb.seq_lithostratunits_lithostratunitid'::regclass) NOT NULL,
    lithostratunit character varying(24) NOT NULL,
    rank integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.lithostratunits IS "";

--- Table indices
CREATE UNIQUE INDEX lithostratunits_pkey ON ndb.lithostratunits USING btree (lithostratunitid)

--- Remove existing constraints if needed
ALTER TABLE ndb.lithostratunits DROP CONSTRAINT IF EXISTS lithostratunits_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.lithostratunits ADD CONSTRAINT lithostratunits_pkey PRIMARY KEY (lithostratunitid);

--- Foreign Key Restraints