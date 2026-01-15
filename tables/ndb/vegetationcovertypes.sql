-- vegetationcovertypes definition

-- Drop table

-- DROP TABLE IF EXISTS vegetationcovertypes.vegetationcovertypes

CREATE TABLE vegetationcovertypes.vegetationcovertypes (
    vegetationcovertypeid integer DEFAULT nextval('ndb.vegetationcovertypes_vegetationcovertypeid_seq'::regclass) NOT NULL,
    vegetationcovertype character varying(128) NULL,
    vegetationcovernotes text NULL,
    vegetationpublicationid integer NULL,
    CONSTRAINT vegetationcovertypes_pkey PRIMARY KEY (vegetationcovertypeid),
    CONSTRAINT vegetationcovertypes_vegetationcovertype_key UNIQUE (vegetationcovertype)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.vegetationcovertypes ADD CONSTRAINT vegetationcovertypes_vegetationpublicationid_fkey FOREIGN KEY (vegetationpublicationid) REFERENCES ndb.publications(publicationid);