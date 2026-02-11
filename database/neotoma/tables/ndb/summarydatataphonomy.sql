-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.summarydatataphonomy

CREATE TABLE IF NOT EXISTS ndb.summarydatataphonomy (

    dataid integer NOT NULL,
    taphonomictypeid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.summarydatataphonomy IS "";

--- Table indices
CREATE UNIQUE INDEX summarydatataphonomy_pkey ON ndb.summarydatataphonomy USING btree (dataid, taphonomictypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.summarydatataphonomy DROP CONSTRAINT IF EXISTS summarydatataphonomy_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.summarydatataphonomy ADD CONSTRAINT summarydatataphonomy_pkey PRIMARY KEY (dataid, taphonomictypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.summarydatataphonomy ADD CONSTRAINT fk_summarydatataphonomy_taphonomictypes FOREIGN KEY (taphonomictypeid) REFERENCES ndb.taphonomictypes(taphonomictypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.summarydatataphonomy ADD CONSTRAINT fk_summarydatataphonomy_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;