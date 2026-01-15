-- formtaxa definition

-- Drop table

-- DROP TABLE IF EXISTS formtaxa.formtaxa

CREATE TABLE formtaxa.formtaxa (
    formtaxonid integer DEFAULT nextval('ndb.seq_formtaxa_formtaxonid'::regclass) NOT NULL,
    taxonid integer NOT NULL,
    affinityid integer NOT NULL,
    publicationid integer NOT NULL,
    systematicdescription boolean NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT formtaxa_pkey PRIMARY KEY (formtaxonid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.formtaxa ADD CONSTRAINT fk_formtaxa_taxa1 FOREIGN KEY (affinityid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.formtaxa ADD CONSTRAINT fk_formtaxa_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.formtaxa ADD CONSTRAINT fk_formtaxa_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid);