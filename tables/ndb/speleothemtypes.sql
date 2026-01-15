-- speleothemtypes definition

-- Drop table

-- DROP TABLE IF EXISTS speleothemtypes.speleothemtypes

CREATE TABLE speleothemtypes.speleothemtypes (
    speleothemtypeid integer DEFAULT nextval('ndb.speleothemtypes_speleothemtypeid_seq'::regclass) NOT NULL,
    speleothemtype character varying(50) NULL,
    speleothemtypenotes text NULL,
    speleothemtypepublicationid integer NULL,
    CONSTRAINT speleothemtypes_pkey PRIMARY KEY (speleothemtypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.speleothemtypes ADD CONSTRAINT speleothemtypes_speleothemtypepublicationid_fkey FOREIGN KEY (speleothemtypepublicationid) REFERENCES ndb.publications(publicationid);