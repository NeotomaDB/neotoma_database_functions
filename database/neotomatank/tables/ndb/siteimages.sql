-- ndb.siteimages Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.siteimages

CREATE TABLE IF NOT EXISTS ndb.siteimages (

    siteimageid integer DEFAULT nextval('ndb.seq_siteimages_siteimageid'::regclass) NOT NULL,
    siteid integer NULL,
    contactid integer NULL,
    caption text NULL,
    credit character varying(255) NULL,
    date date NULL,
    siteimage text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.siteimages IS 'This table stores hyperlinks to jpeg images of sites.';
COMMENT ON COLUMN ndb.siteimages.siteimageid IS 'An arbitrary Site Image identification number.';
COMMENT ON COLUMN ndb.siteimages.siteid IS 'Site identification number. Field links to the Sites table.';
COMMENT ON COLUMN ndb.siteimages.contactid IS 'Contact identification number for image attribution.';
COMMENT ON COLUMN ndb.siteimages.caption IS 'Caption for the image.';
COMMENT ON COLUMN ndb.siteimages.credit IS 'Credit for the image. If null, the credit is formed from the ContactID.';
COMMENT ON COLUMN ndb.siteimages.date IS 'Date of photograph or image.';
COMMENT ON COLUMN ndb.siteimages.siteimage IS 'Hyperlink to a URL for the image.';
COMMENT ON COLUMN ndb.siteimages.recdatecreated IS '';
COMMENT ON COLUMN ndb.siteimages.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX siteimages_pkey ON ndb.siteimages USING btree (siteimageid);
CREATE INDEX ix_siteid_siteimages ON ndb.siteimages USING btree (siteid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.siteimages DROP CONSTRAINT IF EXISTS siteimages_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.siteimages ADD CONSTRAINT siteimages_pkey PRIMARY KEY (siteimageid);

--- Foreign Key Restraints
ALTER TABLE ndb.siteimages ADD CONSTRAINT fk_siteimages_sites FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.siteimages ADD CONSTRAINT fk_siteimages_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.siteimages;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.siteimages;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.siteimages FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.siteimages FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n