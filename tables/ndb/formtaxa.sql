-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.formtaxa

CREATE TABLE IF NOT EXISTS ndb.formtaxa (

    formtaxonid integer DEFAULT nextval('ndb.seq_formtaxa_formtaxonid'::regclass) NOT NULL,
    taxonid integer NOT NULL,
    affinityid integer NOT NULL,
    publicationid integer NOT NULL,
    systematicdescription boolean NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.formtaxa IS "";

--- Table indices
CREATE UNIQUE INDEX formtaxa_pkey ON ndb.formtaxa USING btree (formtaxonid)

--- Remove existing constraints if needed
ALTER TABLE ndb.formtaxa DROP CONSTRAINT IF EXISTS formtaxa_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.formtaxa ADD CONSTRAINT formtaxa_pkey PRIMARY KEY (formtaxonid);

--- Foreign Key Restraints
ALTER TABLE ndb.formtaxa ADD CONSTRAINT fk_formtaxa_taxa1 FOREIGN KEY (affinityid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.formtaxa ADD CONSTRAINT fk_formtaxa_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.formtaxa ADD CONSTRAINT fk_formtaxa_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid);