-- analysisunits definition

-- Drop table

-- DROP TABLE IF EXISTS analysisunits.analysisunits

CREATE TABLE analysisunits.analysisunits (
    analysisunitid integer DEFAULT nextval('ndb.seq_analysisunits_analysisunitid'::regclass) NOT NULL,
    collectionunitid integer NOT NULL,
    analysisunitname character varying(80) NULL,
    depth double precision NULL,
    thickness double precision NULL,
    faciesid integer NULL,
    mixed boolean NOT NULL,
    igsn character varying(40) NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT analysisunits_pkey PRIMARY KEY (analysisunitid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.analysisunits ADD CONSTRAINT fk_analysisunits_collectionunits FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.analysisunits ADD CONSTRAINT fk_analysisunits_faciestypes FOREIGN KEY (faciesid) REFERENCES ndb.faciestypes(faciesid) ON UPDATE CASCADE ON DELETE CASCADE;