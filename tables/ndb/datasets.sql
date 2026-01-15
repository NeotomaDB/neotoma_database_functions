-- datasets definition

-- Drop table

-- DROP TABLE IF EXISTS datasets.datasets

CREATE TABLE datasets.datasets (
    datasetid integer DEFAULT nextval('ndb.seq_datasets_datasetid'::regclass) NOT NULL,
    collectionunitid integer NOT NULL,
    datasettypeid integer NOT NULL,
    datasetname character varying(80) NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    embargoid integer NULL,
    CONSTRAINT datasets_pkey PRIMARY KEY (datasetid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.datasets ADD CONSTRAINT fk_datasets_datasettypes FOREIGN KEY (datasettypeid) REFERENCES ndb.datasettypes(datasettypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasets ADD CONSTRAINT fk_datasets_collectionunits FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasets ADD CONSTRAINT fk_datasets_embargo FOREIGN KEY (embargoid) REFERENCES ndb.embargo(embargoid) ON UPDATE CASCADE ON DELETE CASCADE;