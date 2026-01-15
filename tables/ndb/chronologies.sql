-- chronologies definition

-- Drop table

-- DROP TABLE IF EXISTS chronologies.chronologies

CREATE TABLE chronologies.chronologies (
    chronologyid integer DEFAULT nextval('ndb.seq_chronologies_chronologyid'::regclass) NOT NULL,
    collectionunitid integer NOT NULL,
    agetypeid integer NOT NULL,
    contactid integer NULL,
    isdefault boolean NOT NULL,
    chronologyname character varying(80) NULL,
    dateprepared date NULL,
    agemodel character varying(80) NULL,
    ageboundyounger integer NULL,
    ageboundolder integer NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT chronologies_pkey PRIMARY KEY (chronologyid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.chronologies ADD CONSTRAINT fk_chronologies_collectionunits FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chronologies ADD CONSTRAINT fk_chronologies_agetypes FOREIGN KEY (agetypeid) REFERENCES ndb.agetypes(agetypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chronologies ADD CONSTRAINT fk_chronologies_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;