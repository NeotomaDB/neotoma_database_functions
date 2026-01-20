-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.collectionunits

CREATE TABLE IF NOT EXISTS ndb.collectionunits (

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
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.collectionunits IS "This table stores data for Collection Units.";

--- Table indices
CREATE UNIQUE INDEX collectionunits_pkey ON ndb.collectionunits USING btree (collectionunitid);
CREATE INDEX ix_collectionunitid_collectionunits ON ndb.collectionunits USING btree (collectionunitid) WITH (fillfactor='10');
CREATE INDEX ix_depenvtid_collectionunits ON ndb.collectionunits USING btree (depenvtid) WITH (fillfactor='10');
CREATE INDEX ix_siteid_collectionunits ON ndb.collectionunits USING btree (siteid) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.collectionunits DROP CONSTRAINT IF EXISTS collectionunits_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.collectionunits ADD CONSTRAINT collectionunits_pkey PRIMARY KEY (collectionunitid);

--- Foreign Key Restraints
ALTER TABLE ndb.collectionunits ADD CONSTRAINT fk_collectionunits_depenvttypes FOREIGN KEY (depenvtid) REFERENCES ndb.depenvttypes(depenvtid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.collectionunits ADD CONSTRAINT fk_collectionunits_collectiontypes FOREIGN KEY (colltypeid) REFERENCES ndb.collectiontypes(colltypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.collectionunits ADD CONSTRAINT fk_collectionunits_rocktypes FOREIGN KEY (substrateid) REFERENCES ndb.rocktypes(rocktypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.collectionunits ADD CONSTRAINT fk_collectionunits_sites FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON UPDATE CASCADE ON DELETE CASCADE;