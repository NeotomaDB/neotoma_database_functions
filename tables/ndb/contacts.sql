-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.contacts

CREATE TABLE IF NOT EXISTS ndb.contacts (

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
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.contacts IS "This table lists persons and organizations referenced by the Chronologies, Collectors, DatasetPIs, DatasetSubmissions, Projects, PublicationAuthors, SampleAnalysts, and SiteImages tables.";

--- Table indices
CREATE UNIQUE INDEX contacts_pkey ON ndb.contacts USING btree (contactid);
CREATE INDEX familynames_idx ON ndb.contacts USING gin (familyname gin_trgm_ops)

--- Remove existing constraints if needed
ALTER TABLE ndb.contacts DROP CONSTRAINT IF EXISTS contacts_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.contacts ADD CONSTRAINT contacts_pkey PRIMARY KEY (contactid);

--- Foreign Key Restraints
ALTER TABLE ndb.contacts ADD CONSTRAINT fk_contacts_contactstatuses FOREIGN KEY (contactstatusid) REFERENCES ndb.contactstatuses(contactstatusid) ON UPDATE CASCADE ON DELETE SET NULL;