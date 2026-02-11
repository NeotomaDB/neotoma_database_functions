-- ndb.radiocarbon Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.radiocarbon

CREATE TABLE IF NOT EXISTS ndb.radiocarbon (

    geochronid integer NOT NULL,
    radiocarbonmethodid integer NULL,
    percentc double precision NULL,
    percentn double precision NULL,
    delta13c double precision NULL,
    delta15n double precision NULL,
    percentcollagen double precision NULL,
    reservoir double precision NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    masscmg double precision NULL,
    cnratio double precision NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.radiocarbon IS "";

--- Table indices
CREATE UNIQUE INDEX radiocarbon_pkey ON ndb.radiocarbon USING btree (geochronid);
CREATE UNIQUE INDEX radiocarbon_unique ON ndb.radiocarbon USING btree (geochronid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.radiocarbon DROP CONSTRAINT IF EXISTS radiocarbon_pkey;
-- ALTER TABLE ndb.radiocarbon DROP CONSTRAINT IF EXISTS radiocarbon_unique;

--- Non-foreign key constraints
ALTER TABLE ndb.radiocarbon ADD CONSTRAINT radiocarbon_pkey PRIMARY KEY (geochronid);
ALTER TABLE ndb.radiocarbon ADD CONSTRAINT radiocarbon_unique UNIQUE (geochronid);

--- Foreign Key Restraints
ALTER TABLE ndb.radiocarbon ADD CONSTRAINT fk_geochrons_geochronid FOREIGN KEY (geochronid) REFERENCES ndb.geochronology(geochronid) ON DELETE CASCADE;
ALTER TABLE ndb.radiocarbon ADD CONSTRAINT fk_radiocarbonmethodid FOREIGN KEY (radiocarbonmethodid) REFERENCES ndb.radiocarbonmethods(radiocarbonmethodid);

--- Triggers
-- DROP TRIGGER IF EXISTS cnratio_compute_trigger ON ndb.radiocarbon;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.radiocarbon;
-- DROP TRIGGER IF EXISTS cnratio_compute_trigger ON ndb.radiocarbon;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.radiocarbon;
CREATE TRIGGER cnratio_compute_trigger BEFORE INSERT ON ndb.radiocarbon FOR EACH ROW EXECUTE FUNCTION ndb.compute_cnratio();
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.radiocarbon FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER cnratio_compute_trigger BEFORE UPDATE ON ndb.radiocarbon FOR EACH ROW EXECUTE FUNCTION ndb.compute_cnratio();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.radiocarbon FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();