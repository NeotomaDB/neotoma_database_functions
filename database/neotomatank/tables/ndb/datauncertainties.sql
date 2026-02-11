-- ndb.datauncertainties Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datauncertainties

CREATE TABLE IF NOT EXISTS ndb.datauncertainties (

    dataid integer NULL,
    uncertaintyvalue double precision NULL,
    uncertaintyunitid integer NULL,
    uncertaintybasisid integer NULL,
    notes text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.datauncertainties IS "";

--- Table indices
CREATE UNIQUE INDEX uniqueentryvalue ON ndb.datauncertainties USING btree (dataid, uncertaintyunitid, uncertaintybasisid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.datauncertainties DROP CONSTRAINT IF EXISTS uniqueentryvalue;

--- Non-foreign key constraints
ALTER TABLE ndb.datauncertainties ADD CONSTRAINT uniqueentryvalue UNIQUE (dataid, uncertaintyunitid, uncertaintybasisid);

--- Foreign Key Restraints
ALTER TABLE ndb.datauncertainties ADD CONSTRAINT datauncertainties_uncertaintybasisid_fkey FOREIGN KEY (uncertaintybasisid) REFERENCES ndb.uncertaintybases(uncertaintybasisid);
ALTER TABLE ndb.datauncertainties ADD CONSTRAINT datauncertainties_dataid_fkey FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON DELETE CASCADE;
ALTER TABLE ndb.datauncertainties ADD CONSTRAINT datauncertainties_uncertaintyunitid_fkey FOREIGN KEY (uncertaintyunitid) REFERENCES ndb.variableunits(variableunitsid);

--- Triggers