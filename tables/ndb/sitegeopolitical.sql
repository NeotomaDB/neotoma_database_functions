-- sitegeopolitical definition

-- Drop table

-- DROP TABLE IF EXISTS sitegeopolitical.sitegeopolitical

CREATE TABLE sitegeopolitical.sitegeopolitical (
    sitegeopoliticalid integer DEFAULT nextval('ndb.seq_sitegeopolitical_sitegeopoliticalid'::regclass) NOT NULL,
    siteid integer NOT NULL,
    geopoliticalid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    objectid integer NULL,
    CONSTRAINT sitegeopolitical_pkey PRIMARY KEY (sitegeopoliticalid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.sitegeopolitical ADD CONSTRAINT fk_objectid FOREIGN KEY (objectid) REFERENCES ap.gadm(objectid);
ALTER TABLE ndb.sitegeopolitical ADD CONSTRAINT fk_sitegeopolitical_geopoliticalunits FOREIGN KEY (geopoliticalid) REFERENCES ndb.geopoliticalunits(geopoliticalid);
ALTER TABLE ndb.sitegeopolitical ADD CONSTRAINT fk_sitegeopolitical_sites FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON UPDATE CASCADE ON DELETE CASCADE;