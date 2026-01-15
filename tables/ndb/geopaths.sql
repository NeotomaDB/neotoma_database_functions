-- geopaths definition

-- Drop table

-- DROP TABLE IF EXISTS geopaths.geopaths

CREATE TABLE geopaths.geopaths (
    geoout integer[] NOT NULL,
    geoin bigint NOT NULL,
    CONSTRAINT geopaths_pkey PRIMARY KEY (geoout, geoin)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.geopaths ADD CONSTRAINT geopaths_geoin_fkey FOREIGN KEY (geoin) REFERENCES ndb.geopoliticalunits(geopoliticalid);