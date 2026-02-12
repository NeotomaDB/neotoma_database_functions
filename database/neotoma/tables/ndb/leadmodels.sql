-- ndb.leadmodels Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.leadmodels

CREATE TABLE IF NOT EXISTS ndb.leadmodels (

    pbbasisid integer NULL,
    analysisunitid integer NULL,
    cumulativeinventory numeric NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.leadmodels IS '';
COMMENT ON COLUMN ndb.leadmodels.pbbasisid IS '';
COMMENT ON COLUMN ndb.leadmodels.analysisunitid IS '';
COMMENT ON COLUMN ndb.leadmodels.cumulativeinventory IS '';

--- Table indices


--- Remove existing constraints if needed
-- ALTER TABLE ndb.leadmodels DROP CONSTRAINT IF EXISTS leadmodels_cumulativeinventory_check;

--- Non-foreign key constraints
ALTER TABLE ndb.leadmodels ADD CONSTRAINT leadmodels_cumulativeinventory_check CHECK ((cumulativeinventory > (0)::numeric));

--- Foreign Key Restraints
ALTER TABLE ndb.leadmodels ADD CONSTRAINT leadmodels_pbbasisid_fkey FOREIGN KEY (pbbasisid) REFERENCES ndb.leadmodelbasis(pbbasisid);
ALTER TABLE ndb.leadmodels ADD CONSTRAINT leadmodels_analysisunitid_fkey FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid);

--- Triggers