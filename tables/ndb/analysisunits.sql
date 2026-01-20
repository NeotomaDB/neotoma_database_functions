-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.analysisunits

CREATE TABLE IF NOT EXISTS ndb.analysisunits (

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
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.analysisunits IS "This table stores the data for Analysis Units.";

--- Table indices
CREATE UNIQUE INDEX analysisunits_pkey ON ndb.analysisunits USING btree (analysisunitid);
CREATE INDEX analysisunits_collunit_idx ON ndb.analysisunits USING btree (collectionunitid);
CREATE INDEX analysisunits_facies_idx ON ndb.analysisunits USING btree (faciesid)

--- Remove existing constraints if needed
ALTER TABLE ndb.analysisunits DROP CONSTRAINT IF EXISTS analysisunits_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.analysisunits ADD CONSTRAINT analysisunits_pkey PRIMARY KEY (analysisunitid);

--- Foreign Key Restraints
ALTER TABLE ndb.analysisunits ADD CONSTRAINT fk_analysisunits_collectionunits FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.analysisunits ADD CONSTRAINT fk_analysisunits_faciestypes FOREIGN KEY (faciesid) REFERENCES ndb.faciestypes(faciesid) ON UPDATE CASCADE ON DELETE CASCADE;