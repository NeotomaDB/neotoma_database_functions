-- decayconstants definition

-- Drop table

-- DROP TABLE IF EXISTS decayconstants.decayconstants

CREATE TABLE decayconstants.decayconstants (
    decayconstantid integer DEFAULT nextval('ndb.decayconstants_decayconstantid_seq'::regclass) NOT NULL,
    decayconstant text NULL,
    publicationid integer NULL,
    notes text NULL,
    CONSTRAINT decayconstants_pkey PRIMARY KEY (decayconstantid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.decayconstants ADD CONSTRAINT decayconstants_publicationid_fkey FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid);