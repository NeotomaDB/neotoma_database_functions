-- contacts definition

-- Drop table

-- DROP TABLE IF EXISTS contacts.contacts

CREATE TABLE contacts.contacts (
    contactid integer DEFAULT nextval('ndb.seq_contacts_contactid'::regclass) NOT NULL,
    aliasid integer NULL,
    contactname character varying(80) NOT NULL,
    contactstatusid integer NULL,
    familyname character varying(80) NULL,
    leadinginitials character varying(16) NULL,
    givennames character varying(80) NULL,
    suffix character varying(16) NULL,
    title character varying(16) NULL,
    phone character varying(64) NULL,
    fax character varying(64) NULL,
    email character varying(64) NULL,
    url character varying(255) NULL,
    address text NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT contacts_pkey PRIMARY KEY (contactid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.contacts ADD CONSTRAINT fk_contacts_contactstatuses FOREIGN KEY (contactstatusid) REFERENCES ndb.contactstatuses(contactstatusid) ON UPDATE CASCADE ON DELETE SET NULL;