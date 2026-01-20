-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.specimentaphonomy

CREATE TABLE IF NOT EXISTS ndb.specimentaphonomy (

    specimenid integer NOT NULL,
    taphonomictypeid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.specimentaphonomy IS "";

--- Table indices
CREATE UNIQUE INDEX specimentaphonomy_pkey ON ndb.specimentaphonomy USING btree (specimenid, taphonomictypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.specimentaphonomy DROP CONSTRAINT IF EXISTS specimentaphonomy_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.specimentaphonomy ADD CONSTRAINT specimentaphonomy_pkey PRIMARY KEY (specimenid, taphonomictypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.specimentaphonomy ADD CONSTRAINT fk_specimentaphonomy_specimens FOREIGN KEY (specimenid) REFERENCES ndb.specimens(specimenid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.specimentaphonomy ADD CONSTRAINT fk_specimentaphonomy_taphonomictypes FOREIGN KEY (taphonomictypeid) REFERENCES ndb.taphonomictypes(taphonomictypeid) ON UPDATE CASCADE ON DELETE CASCADE;