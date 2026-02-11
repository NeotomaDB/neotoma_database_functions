-- ndb.ecolgroups Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.ecolgroups

CREATE TABLE IF NOT EXISTS ndb.ecolgroups (

    taxonid integer NOT NULL,
    ecolsetid integer NOT NULL,
    ecolgroupid character varying(4) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.ecolgroups IS "Taxa are assigned to Sets of Ecological Groups. A taxon may be assigned to more than one Set of Ecological Groups, representing different schemes for organizing taxa.";

--- Table indices
CREATE UNIQUE INDEX ecolgroups_pkey ON ndb.ecolgroups USING btree (taxonid, ecolsetid);
CREATE INDEX ix_ecolgroupid_ecolgroups ON ndb.ecolgroups USING btree (ecolgroupid) WITH (fillfactor='10');
CREATE INDEX ix_ecolsetid_ecolgroups ON ndb.ecolgroups USING btree (ecolsetid) WITH (fillfactor='10');
CREATE INDEX ix_taxonid_ecolgroups ON ndb.ecolgroups USING btree (taxonid) WITH (fillfactor='10');
CREATE UNIQUE INDEX ecolgroups_unique ON ndb.ecolgroups USING btree (taxonid, ecolsetid, ecolgroupid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.ecolgroups DROP CONSTRAINT IF EXISTS ecolgroups_pkey;
-- ALTER TABLE ndb.ecolgroups DROP CONSTRAINT IF EXISTS ecolgroups_unique;

--- Non-foreign key constraints
ALTER TABLE ndb.ecolgroups ADD CONSTRAINT ecolgroups_pkey PRIMARY KEY (taxonid, ecolsetid);
ALTER TABLE ndb.ecolgroups ADD CONSTRAINT ecolgroups_unique UNIQUE (taxonid, ecolsetid, ecolgroupid);

--- Foreign Key Restraints
ALTER TABLE ndb.ecolgroups ADD CONSTRAINT fk_ecolgroups_ecolgrouptypes FOREIGN KEY (ecolgroupid) REFERENCES ndb.ecolgrouptypes(ecolgroupid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.ecolgroups ADD CONSTRAINT fk_ecolgroups_ecolsettypes FOREIGN KEY (ecolsetid) REFERENCES ndb.ecolsettypes(ecolsetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.ecolgroups ADD CONSTRAINT fk_ecolgroups_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.ecolgroups;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.ecolgroups;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.ecolgroups FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.ecolgroups FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();