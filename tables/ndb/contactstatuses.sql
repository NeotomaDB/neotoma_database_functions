-- contactstatuses definition

-- Drop table

-- DROP TABLE IF EXISTS contactstatuses.contactstatuses

CREATE TABLE contactstatuses.contactstatuses (
    contactstatusid integer DEFAULT nextval('ndb.seq_contactstatuses_contactstatusid'::regclass) NOT NULL,
    contactstatus character varying(16) NULL,
    statusdescription character varying(255) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT contactstatuses_pkey PRIMARY KEY (contactstatusid)
);


-- adempiere.wmv_ghgaudit foreign keys

;