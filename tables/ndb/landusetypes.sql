-- landusetypes definition

-- Drop table

-- DROP TABLE IF EXISTS landusetypes.landusetypes

CREATE TABLE landusetypes.landusetypes (
    landusecovertypeid integer DEFAULT nextval('ndb.landusetypes_landusecovertypeid_seq'::regclass) NOT NULL,
    landusecovertype character varying(128) NULL,
    landusecovernotes text NULL,
    publicationid integer NULL,
    CONSTRAINT landusetypes_pkey PRIMARY KEY (landusecovertypeid),
    CONSTRAINT landusetypes_landusecovertype_key UNIQUE (landusecovertype)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.landusetypes ADD CONSTRAINT landusetypes_landuseclasspublicationid_fkey FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid);