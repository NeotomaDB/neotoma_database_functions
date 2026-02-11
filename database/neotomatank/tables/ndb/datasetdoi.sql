-- ndb.datasetdoi Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasetdoi

CREATE TABLE IF NOT EXISTS ndb.datasetdoi (

    datasetid integer NOT NULL,
    doi character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    published boolean DEFAULT true NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.datasetdoi IS "";

--- Table indices
CREATE UNIQUE INDEX datasetdoi_pkey ON ndb.datasetdoi USING btree (datasetid, doi);
CREATE INDEX idx_datasetdoi_datasetid ON ndb.datasetdoi USING btree (datasetid);
CREATE INDEX idx_datasetdoi_datasetid_doi ON ndb.datasetdoi USING btree (datasetid) INCLUDE (doi)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.datasetdoi DROP CONSTRAINT IF EXISTS datasetdoi_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datasetdoi ADD CONSTRAINT datasetdoi_pkey PRIMARY KEY (datasetid, doi);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasetdoi;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datasetdoi;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.datasetdoi FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.datasetdoi FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();