-- stewardupdates definition

-- Drop table

-- DROP TABLE IF EXISTS stewardupdates.stewardupdates

CREATE TABLE stewardupdates.stewardupdates (
    updateid integer NOT NULL,
    contactid integer NOT NULL,
    tablename character varying(64) NOT NULL,
    pk1 integer NULL,
    pk2 integer NULL,
    pk3 character varying(24) NULL,
    operation character varying(24) NOT NULL,
    columnname character varying(64) NULL,
    dateupdated timestamp(0) without time zone NOT NULL,
    CONSTRAINT stewardupdates_pkey PRIMARY KEY (updateid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ti.stewardupdates ADD CONSTRAINT fk_stewardupdates_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);