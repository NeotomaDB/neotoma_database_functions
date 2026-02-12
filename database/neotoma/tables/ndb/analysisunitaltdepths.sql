-- ndb.analysisunitaltdepths Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.analysisunitaltdepths

CREATE TABLE IF NOT EXISTS ndb.analysisunitaltdepths (

    analysisunitid integer NOT NULL,
    altdepthscaleid integer NOT NULL,
    altdepth double precision NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.analysisunitaltdepths IS '';
COMMENT ON COLUMN ndb.analysisunitaltdepths.analysisunitid IS '';
COMMENT ON COLUMN ndb.analysisunitaltdepths.altdepthscaleid IS '';
COMMENT ON COLUMN ndb.analysisunitaltdepths.altdepth IS '';
COMMENT ON COLUMN ndb.analysisunitaltdepths.recdatecreated IS '';
COMMENT ON COLUMN ndb.analysisunitaltdepths.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX analysisunitaltdepths_pkey ON ndb.analysisunitaltdepths USING btree (altdepthscaleid, analysisunitid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.analysisunitaltdepths DROP CONSTRAINT IF EXISTS analysisunitaltdepths_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.analysisunitaltdepths ADD CONSTRAINT analysisunitaltdepths_pkey PRIMARY KEY (altdepthscaleid, analysisunitid);

--- Foreign Key Restraints
ALTER TABLE ndb.analysisunitaltdepths ADD CONSTRAINT fk_analysisunitaltdepths_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.analysisunitaltdepths ADD CONSTRAINT fk_analysisunitaltdepths_analysisunitaltdepthscales FOREIGN KEY (altdepthscaleid) REFERENCES ndb.analysisunitaltdepthscales(altdepthscaleid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.analysisunitaltdepths;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.analysisunitaltdepths;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.analysisunitaltdepths FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.analysisunitaltdepths FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n