-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.taxa

CREATE TABLE IF NOT EXISTS ndb.taxa (

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
    recdatemodified timestamp(0) without time zone NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.taxa IS "This table lists all taxa in the database. Most taxa are biological taxa; however, some are biometric measures and some are physical parameters.";

--- Table indices
CREATE UNIQUE INDEX taxa_pkey ON ndb.taxa USING btree (taxonid);
CREATE INDEX ix_taxagroupid_taxa ON ndb.taxa USING btree (taxagroupid) WITH (fillfactor='10');
CREATE INDEX ix_taxonname_taxa ON ndb.taxa USING btree (taxonname) WITH (fillfactor='10');
CREATE INDEX taxonames_idx ON ndb.taxa USING gin (taxonname gin_trgm_ops);
CREATE INDEX taxonname_btree ON ndb.taxa USING btree (taxonname)

--- Remove existing constraints if needed
ALTER TABLE ndb.taxa DROP CONSTRAINT IF EXISTS taxa_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.taxa ADD CONSTRAINT taxa_pkey PRIMARY KEY (taxonid);

--- Foreign Key Restraints
ALTER TABLE ndb.taxa ADD CONSTRAINT fk_publicationid FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid);
ALTER TABLE ndb.taxa ADD CONSTRAINT fk_validatorid FOREIGN KEY (validatorid) REFERENCES ndb.contacts(contactid);
ALTER TABLE ndb.taxa ADD CONSTRAINT fk_highertaxonid FOREIGN KEY (highertaxonid) REFERENCES ndb.taxa(taxonid);
ALTER TABLE ndb.taxa ADD CONSTRAINT fk_taxagroupid FOREIGN KEY (taxagroupid) REFERENCES ndb.taxagrouptypes(taxagroupid);