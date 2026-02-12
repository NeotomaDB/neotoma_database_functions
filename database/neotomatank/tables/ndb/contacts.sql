-- ndb.contacts Table definition

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


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.contacts IS 'This table lists persons and organizations referenced by the Chronologies, Collectors, DatasetPIs, DatasetSubmissions, Projects, PublicationAuthors, SampleAnalysts, and SiteImages tables.';
COMMENT ON COLUMN ndb.contacts.contactid IS 'An arbitrary Contact identification number.';
COMMENT ON COLUMN ndb.contacts.aliasid IS 'The ContactID of a person’s current name. If the AliasID is different from the ContactID, the ContactID refers to the person’s former name. For example, if J. L. Bouvier became J. B. Kennedy, the ContactID for J. B. Kennedy is the AliasID for J. L. Bouvier.';
COMMENT ON COLUMN ndb.contacts.contactname IS 'Full name of the person, last name first (e.g. «Simpson, George Gaylord») or name of organization or project (e.g. «Great Plains Flora Association»).';
COMMENT ON COLUMN ndb.contacts.contactstatusid IS 'Current status of the person, organization, or project. Field links to the ContactStatuses lookup table.';
COMMENT ON COLUMN ndb.contacts.familyname IS 'Family or surname name of a person.';
COMMENT ON COLUMN ndb.contacts.leadinginitials IS 'Leading initials for given or forenames without spaces (e.g. «G.G.»).';
COMMENT ON COLUMN ndb.contacts.givennames IS 'Given or forenames of a person (e.g. «George Gaylord»). Initials with spaces are used if full given names are not known (e.g. «G. G»).';
COMMENT ON COLUMN ndb.contacts.suffix IS 'Suffix of a person’s name (e.g. «Jr.», «III»).';
COMMENT ON COLUMN ndb.contacts.title IS 'A person’s title (e.g. «Dr.», «Prof.», «Prof. Dr»).';
COMMENT ON COLUMN ndb.contacts.phone IS 'Telephone number.';
COMMENT ON COLUMN ndb.contacts.fax IS 'Fax number.';
COMMENT ON COLUMN ndb.contacts.email IS 'Email address.';
COMMENT ON COLUMN ndb.contacts.url IS 'Universal Resource Locator, an Internet World Wide Web address.';
COMMENT ON COLUMN ndb.contacts.address IS 'Full mailing address.';
COMMENT ON COLUMN ndb.contacts.notes IS 'Free form notes or comments about the person, organization, or project.';
COMMENT ON COLUMN ndb.contacts.recdatecreated IS '';
COMMENT ON COLUMN ndb.contacts.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX contacts_pkey ON ndb.contacts USING btree (contactid);
CREATE INDEX familynames_idx ON ndb.contacts USING gin (familyname gin_trgm_ops)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.contacts DROP CONSTRAINT IF EXISTS contacts_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.contacts ADD CONSTRAINT contacts_pkey PRIMARY KEY (contactid);

--- Foreign Key Restraints
ALTER TABLE ndb.contacts ADD CONSTRAINT fk_contacts_contactstatuses FOREIGN KEY (contactstatusid) REFERENCES ndb.contactstatuses(contactstatusid) ON UPDATE CASCADE ON DELETE SET NULL;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.contacts;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.contacts;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.contacts FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.contacts FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n