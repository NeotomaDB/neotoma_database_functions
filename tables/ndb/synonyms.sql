-- synonyms definition

-- Drop table

-- DROP TABLE IF EXISTS synonyms.synonyms

CREATE TABLE synonyms.synonyms (
    synonymid integer DEFAULT nextval('ndb.seq_synonyms_synonymid'::regclass) NOT NULL,
    invalidtaxonid integer NOT NULL,
    validtaxonid integer NOT NULL,
    synonymtypeid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT synonyms_pkey PRIMARY KEY (synonymid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.synonyms ADD CONSTRAINT fk_synonyms_synonymtypes FOREIGN KEY (synonymtypeid) REFERENCES ndb.synonymtypes(synonymtypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.synonyms ADD CONSTRAINT fk_synonyms_invalidtaxa FOREIGN KEY (invalidtaxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.synonyms ADD CONSTRAINT fk_synonyms_validtaxa FOREIGN KEY (validtaxonid) REFERENCES ndb.taxa(taxonid);