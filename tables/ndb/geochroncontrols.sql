-- geochroncontrols definition

-- Drop table

-- DROP TABLE IF EXISTS geochroncontrols.geochroncontrols

CREATE TABLE geochroncontrols.geochroncontrols (
    chroncontrolid integer NOT NULL,
    geochronid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT geochroncontrols_pkey PRIMARY KEY (chroncontrolid, geochronid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.geochroncontrols ADD CONSTRAINT fk_geochroncontrols_geochronology FOREIGN KEY (geochronid) REFERENCES ndb.geochronology(geochronid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.geochroncontrols ADD CONSTRAINT fk_geochroncontrols_chroncontrols FOREIGN KEY (chroncontrolid) REFERENCES ndb.chroncontrols(chroncontrolid) ON UPDATE CASCADE ON DELETE CASCADE;