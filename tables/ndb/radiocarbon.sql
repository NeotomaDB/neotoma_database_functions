-- radiocarbon definition

-- Drop table

-- DROP TABLE IF EXISTS radiocarbon.radiocarbon

CREATE TABLE radiocarbon.radiocarbon (
    geochronid integer NOT NULL,
    radiocarbonmethodid integer NULL,
    percentc double precision NULL,
    percentn double precision NULL,
    delta13c double precision NULL,
    delta15n double precision NULL,
    percentcollagen double precision NULL,
    reservoir double precision NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    masscmg double precision NULL,
    cnratio double precision NULL,
    CONSTRAINT radiocarbon_pkey PRIMARY KEY (geochronid),
    CONSTRAINT radiocarbon_unique UNIQUE (geochronid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.radiocarbon ADD CONSTRAINT fk_radiocarbonmethodid FOREIGN KEY (radiocarbonmethodid) REFERENCES ndb.radiocarbonmethods(radiocarbonmethodid);
ALTER TABLE ndb.radiocarbon ADD CONSTRAINT fk_geochrons_geochronid FOREIGN KEY (geochronid) REFERENCES ndb.geochronology(geochronid) ON DELETE CASCADE;