-- specimentaphonomy definition

-- Drop table

-- DROP TABLE IF EXISTS specimentaphonomy.specimentaphonomy

CREATE TABLE specimentaphonomy.specimentaphonomy (
    specimenid integer NOT NULL,
    taphonomictypeid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT specimentaphonomy_pkey PRIMARY KEY (specimenid, taphonomictypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.specimentaphonomy ADD CONSTRAINT fk_specimentaphonomy_specimens FOREIGN KEY (specimenid) REFERENCES ndb.specimens(specimenid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.specimentaphonomy ADD CONSTRAINT fk_specimentaphonomy_taphonomictypes FOREIGN KEY (taphonomictypeid) REFERENCES ndb.taphonomictypes(taphonomictypeid) ON UPDATE CASCADE ON DELETE CASCADE;