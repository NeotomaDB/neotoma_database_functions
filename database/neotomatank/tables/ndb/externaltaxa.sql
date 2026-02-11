-- ndb.externaltaxa Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.externaltaxa

CREATE TABLE IF NOT EXISTS ndb.externaltaxa (

    taxonid integer NOT NULL,
    extdatabaseid integer NOT NULL,
    exttaxonid character varying(64) NOT NULL,
    url character varying(128) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.externaltaxa IS "";

--- Table indices
CREATE UNIQUE INDEX externaltaxa_pkey ON ndb.externaltaxa USING btree (taxonid, extdatabaseid, exttaxonid);
CREATE INDEX ix_extdatabaseid_exttaxonid_externaltaxa ON ndb.externaltaxa USING btree (extdatabaseid, exttaxonid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.externaltaxa DROP CONSTRAINT IF EXISTS externaltaxa_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.externaltaxa ADD CONSTRAINT externaltaxa_pkey PRIMARY KEY (taxonid, extdatabaseid, exttaxonid);

--- Foreign Key Restraints
ALTER TABLE ndb.externaltaxa ADD CONSTRAINT fk_externaltaxa_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.externaltaxa ADD CONSTRAINT fk_externaltaxa_externaldatabases FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.externaltaxa;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.externaltaxa;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.externaltaxa FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.externaltaxa FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();