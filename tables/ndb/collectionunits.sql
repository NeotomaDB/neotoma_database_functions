-- collectionunits definition

-- Drop table

-- DROP TABLE IF EXISTS collectionunits.collectionunits

CREATE TABLE collectionunits.collectionunits (
    collectionunitid integer DEFAULT nextval('ndb.seq_collectionunits_collectionunitid'::regclass) NOT NULL,
    handle character varying(16) NOT NULL,
    siteid integer NOT NULL,
    colltypeid integer NULL,
    depenvtid integer NULL,
    collunitname character varying(255) NULL,
    colldate date NULL,
    colldevice character varying(255) NULL,
    gpslatitude double precision NULL,
    gpslongitude double precision NULL,
    gpsaltitude double precision NULL,
    gpserror double precision NULL,
    waterdepth double precision NULL,
    substrateid integer NULL,
    slopeaspect integer NULL,
    slopeangle integer NULL,
    location character varying(255) NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT collectionunits_pkey PRIMARY KEY (collectionunitid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.collectionunits ADD CONSTRAINT fk_collectionunits_depenvttypes FOREIGN KEY (depenvtid) REFERENCES ndb.depenvttypes(depenvtid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.collectionunits ADD CONSTRAINT fk_collectionunits_collectiontypes FOREIGN KEY (colltypeid) REFERENCES ndb.collectiontypes(colltypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.collectionunits ADD CONSTRAINT fk_collectionunits_rocktypes FOREIGN KEY (substrateid) REFERENCES ndb.rocktypes(rocktypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.collectionunits ADD CONSTRAINT fk_collectionunits_sites FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON UPDATE CASCADE ON DELETE CASCADE;