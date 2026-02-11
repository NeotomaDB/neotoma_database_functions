-- ndb.accumulationrates Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.accumulationrates

CREATE TABLE IF NOT EXISTS ndb.accumulationrates (

    analysisunitid integer NOT NULL,
    chronologyid integer NOT NULL,
    accumulationrate double precision NOT NULL,
    variableunitsid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.accumulationrates IS "";

--- Table indices
CREATE UNIQUE INDEX accumulationrates_pkey ON ndb.accumulationrates USING btree (analysisunitid, chronologyid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.accumulationrates DROP CONSTRAINT IF EXISTS accumulationrates_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.accumulationrates ADD CONSTRAINT accumulationrates_pkey PRIMARY KEY (analysisunitid, chronologyid);

--- Foreign Key Restraints
ALTER TABLE ndb.accumulationrates ADD CONSTRAINT fk_accumulationrates_chronologies FOREIGN KEY (chronologyid) REFERENCES ndb.chronologies(chronologyid);
ALTER TABLE ndb.accumulationrates ADD CONSTRAINT fk_accumulationrates_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.accumulationrates ADD CONSTRAINT fk_accumulationrates_variableunits FOREIGN KEY (variableunitsid) REFERENCES ndb.variableunits(variableunitsid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.accumulationrates;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.accumulationrates;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.accumulationrates FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.accumulationrates FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();