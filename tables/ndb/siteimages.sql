-- siteimages definition

-- Drop table

-- DROP TABLE IF EXISTS siteimages.siteimages

CREATE TABLE siteimages.siteimages (
    siteimageid integer DEFAULT nextval('ndb.seq_siteimages_siteimageid'::regclass) NOT NULL,
    siteid integer NULL,
    contactid integer NULL,
    caption text NULL,
    credit character varying(255) NULL,
    date date NULL,
    siteimage text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT siteimages_pkey PRIMARY KEY (siteimageid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.siteimages ADD CONSTRAINT fk_siteimages_sites FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.siteimages ADD CONSTRAINT fk_siteimages_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;