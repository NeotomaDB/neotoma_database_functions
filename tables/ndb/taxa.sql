-- taxa definition

-- Drop table

-- DROP TABLE IF EXISTS taxa.taxa

CREATE TABLE taxa.taxa (
    taxonid integer DEFAULT nextval('ndb.seq_taxa_taxonid'::regclass) NOT NULL,
    taxoncode character varying(64) NOT NULL,
    taxonname text NOT NULL,
    author character varying(128) NULL,
    valid boolean NULL,
    highertaxonid integer NULL,
    extinct boolean NOT NULL,
    taxagroupid character varying(3) NOT NULL,
    publicationid integer NULL,
    validatorid integer NULL,
    validatedate date NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NULL,
    recdatemodified timestamp(0) without time zone NULL,
    CONSTRAINT taxa_pkey PRIMARY KEY (taxonid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.taxa ADD CONSTRAINT fk_publicationid FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid);
ALTER TABLE ndb.taxa ADD CONSTRAINT fk_validatorid FOREIGN KEY (validatorid) REFERENCES ndb.contacts(contactid);
ALTER TABLE ndb.taxa ADD CONSTRAINT fk_highertaxonid FOREIGN KEY (highertaxonid) REFERENCES ndb.taxa(taxonid);
ALTER TABLE ndb.taxa ADD CONSTRAINT fk_taxagroupid FOREIGN KEY (taxagroupid) REFERENCES ndb.taxagrouptypes(taxagroupid);