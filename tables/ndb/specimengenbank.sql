-- specimengenbank definition

-- Drop table

-- DROP TABLE IF EXISTS specimengenbank.specimengenbank

CREATE TABLE specimengenbank.specimengenbank (
    specimenid integer NOT NULL,
    genbanknr character varying(50) NOT NULL,
    CONSTRAINT specimengenbank_pkey PRIMARY KEY (specimenid, genbanknr)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.specimengenbank ADD CONSTRAINT fk_specimengenbank_specimens FOREIGN KEY (specimenid) REFERENCES ndb.specimens(specimenid) ON UPDATE CASCADE ON DELETE CASCADE;