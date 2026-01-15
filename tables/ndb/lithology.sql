-- lithology definition

-- Drop table

-- DROP TABLE IF EXISTS lithology.lithology

CREATE TABLE lithology.lithology (
    lithologyid integer DEFAULT nextval('ndb.seq_lithology_lithologyid'::regclass) NOT NULL,
    collectionunitid integer NOT NULL,
    depthtop double precision NULL,
    depthbottom double precision NULL,
    lowerboundary character varying(255) NULL,
    description text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT lithology_pkey PRIMARY KEY (lithologyid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.lithology ADD CONSTRAINT fk_lithology_collectionunits FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON UPDATE CASCADE ON DELETE CASCADE;