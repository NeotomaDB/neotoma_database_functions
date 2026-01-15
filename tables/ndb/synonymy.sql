-- synonymy definition

-- Drop table

-- DROP TABLE IF EXISTS synonymy.synonymy

CREATE TABLE synonymy.synonymy (
    synonymyid integer DEFAULT nextval('ndb.seq_synonymy_synonymyid'::regclass) NOT NULL,
    datasetid integer NOT NULL,
    taxonid integer NOT NULL,
    reftaxonid integer NOT NULL,
    fromcontributor boolean NULL,
    publicationid integer NULL,
    notes text NULL,
    contactid integer NULL,
    datesynonymized date NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT synonymy_pkey PRIMARY KEY (synonymyid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.synonymy ADD CONSTRAINT fk_synonymy_taxa2 FOREIGN KEY (reftaxonid) REFERENCES ndb.taxa(taxonid);
ALTER TABLE ndb.synonymy ADD CONSTRAINT fk_synonymy_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.synonymy ADD CONSTRAINT fk_synonymy_taxa1 FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.synonymy ADD CONSTRAINT fk_synonymy_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);
ALTER TABLE ndb.synonymy ADD CONSTRAINT fk_synonymy_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;