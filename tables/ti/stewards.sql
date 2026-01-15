-- stewards definition

-- Drop table

-- DROP TABLE IF EXISTS stewards.stewards

CREATE TABLE stewards.stewards (
    stewardid integer DEFAULT nextval('ti.stewardid_seq'::regclass) NOT NULL,
    contactid integer NOT NULL,
    username character varying(15) NOT NULL,
    pwd character varying(15) NOT NULL,
    taxonomyexpert boolean NOT NULL,
    recdatecreated timestamp(0) without time zone NULL,
    recdatemodified timestamp(0) without time zone NULL,
    CONSTRAINT stewards_pkey PRIMARY KEY (stewardid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ti.stewards ADD CONSTRAINT fk_stewards_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;