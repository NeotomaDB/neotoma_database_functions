-- ndb.repositoryspecimens Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.repositoryspecimens

CREATE TABLE IF NOT EXISTS ndb.repositoryspecimens (

    datasetid integer NOT NULL,
    repositoryid integer NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.repositoryspecimens IS "This table lists the repositories in which fossil specimens have been accessioned or reposited. The inventory in Neotoma is by Dataset, which is the collection of specimens from a Collection Unit. Occasionally, specimens from a single Collection Unit have been reposited at different institutions, in which case multiple records for that Dataset occur in the table.";

--- Table indices
CREATE UNIQUE INDEX repositoryspecimens_pkey ON ndb.repositoryspecimens USING btree (datasetid, repositoryid);
CREATE INDEX ix_datasetid_repositoryspecimens ON ndb.repositoryspecimens USING btree (datasetid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.repositoryspecimens DROP CONSTRAINT IF EXISTS repositoryspecimens_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.repositoryspecimens ADD CONSTRAINT repositoryspecimens_pkey PRIMARY KEY (datasetid, repositoryid);

--- Foreign Key Restraints
ALTER TABLE ndb.repositoryspecimens ADD CONSTRAINT fk_repositoryspecimens_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.repositoryspecimens ADD CONSTRAINT fk_repositoryspecimens_repositoryinstitutions FOREIGN KEY (repositoryid) REFERENCES ndb.repositoryinstitutions(repositoryid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.repositoryspecimens;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.repositoryspecimens;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.repositoryspecimens FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.repositoryspecimens FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();