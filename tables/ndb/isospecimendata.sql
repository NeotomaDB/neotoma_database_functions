-- isospecimendata definition

-- Drop table

-- DROP TABLE IF EXISTS isospecimendata.isospecimendata

CREATE TABLE isospecimendata.isospecimendata (
    isospecimendataid integer DEFAULT nextval('ndb.seq_isospecimendata_isospecimendataid'::regclass) NOT NULL,
    dataid integer NOT NULL,
    specimenid integer NOT NULL,
    sd double precision NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isospecimendata_pkey PRIMARY KEY (isospecimendataid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.isospecimendata ADD CONSTRAINT fk_isospecimendata_specimens FOREIGN KEY (specimenid) REFERENCES ndb.specimens(specimenid) ON DELETE CASCADE;
ALTER TABLE ndb.isospecimendata ADD CONSTRAINT fk_isospecimendata_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;