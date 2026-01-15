-- summarydatataphonomy definition

-- Drop table

-- DROP TABLE IF EXISTS summarydatataphonomy.summarydatataphonomy

CREATE TABLE summarydatataphonomy.summarydatataphonomy (
    dataid integer NOT NULL,
    taphonomictypeid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT summarydatataphonomy_pkey PRIMARY KEY (dataid, taphonomictypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.summarydatataphonomy ADD CONSTRAINT fk_summarydatataphonomy_taphonomictypes FOREIGN KEY (taphonomictypeid) REFERENCES ndb.taphonomictypes(taphonomictypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.summarydatataphonomy ADD CONSTRAINT fk_summarydatataphonomy_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;