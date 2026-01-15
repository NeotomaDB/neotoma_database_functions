-- speleothemdriptypes definition

-- Drop table

-- DROP TABLE IF EXISTS speleothemdriptypes.speleothemdriptypes

CREATE TABLE speleothemdriptypes.speleothemdriptypes (
    speleothemdriptypeid integer DEFAULT nextval('ndb.speleothemdriptypes_speleothemdriptypeid_seq'::regclass) NOT NULL,
    speleothemdriptype character varying(50) NULL,
    speleothemdriptypenotes text NULL,
    speleothemdriptypepublicationid integer NULL,
    CONSTRAINT speleothemdriptypes_pkey PRIMARY KEY (speleothemdriptypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.speleothemdriptypes ADD CONSTRAINT speleothemdriptypes_speleothemdriptypepublicationid_fkey FOREIGN KEY (speleothemdriptypepublicationid) REFERENCES ndb.publications(publicationid);