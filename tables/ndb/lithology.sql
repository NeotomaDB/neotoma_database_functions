-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.lithology

CREATE TABLE IF NOT EXISTS ndb.lithology (

    lithologyid integer DEFAULT nextval('ndb.seq_lithology_lithologyid'::regclass) NOT NULL,
    collectionunitid integer NOT NULL,
    depthtop double precision NULL,
    depthbottom double precision NULL,
    lowerboundary character varying(255) NULL,
    description text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.lithology IS "This table stores the lithologic descriptions of Collection Units.";

--- Table indices
CREATE UNIQUE INDEX lithology_pkey ON ndb.lithology USING btree (lithologyid);
CREATE INDEX ix_collectionunitid_lithology ON ndb.lithology USING btree (collectionunitid) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.lithology DROP CONSTRAINT IF EXISTS lithology_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.lithology ADD CONSTRAINT lithology_pkey PRIMARY KEY (lithologyid);

--- Foreign Key Restraints
ALTER TABLE ndb.lithology ADD CONSTRAINT fk_lithology_collectionunits FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON UPDATE CASCADE ON DELETE CASCADE;