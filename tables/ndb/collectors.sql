-- collectors definition

-- Drop table

-- DROP TABLE IF EXISTS collectors.collectors

CREATE TABLE collectors.collectors (
    collectorid integer DEFAULT nextval('ndb.seq_collectors_collectorid'::regclass) NOT NULL,
    collectionunitid integer NOT NULL,
    contactid integer NOT NULL,
    collectororder integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT collectors_pkey PRIMARY KEY (collectorid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.collectors ADD CONSTRAINT fk_collectors_collectionunits FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.collectors ADD CONSTRAINT fk_collectors_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;