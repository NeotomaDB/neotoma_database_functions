-- ndb.geochroncontrols Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.geochroncontrols

CREATE TABLE IF NOT EXISTS ndb.geochroncontrols (

    chroncontrolid integer NOT NULL,
    geochronid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.geochroncontrols IS "";

--- Table indices
CREATE UNIQUE INDEX geochroncontrols_pkey ON ndb.geochroncontrols USING btree (chroncontrolid, geochronid);
CREATE INDEX ix_chroncontrolid_geochroncontrols ON ndb.geochroncontrols USING btree (chroncontrolid) WITH (fillfactor='10');
CREATE INDEX ix_geochronid_geochroncontrols ON ndb.geochroncontrols USING btree (geochronid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.geochroncontrols DROP CONSTRAINT IF EXISTS geochroncontrols_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.geochroncontrols ADD CONSTRAINT geochroncontrols_pkey PRIMARY KEY (chroncontrolid, geochronid);

--- Foreign Key Restraints
ALTER TABLE ndb.geochroncontrols ADD CONSTRAINT fk_geochroncontrols_chroncontrols FOREIGN KEY (chroncontrolid) REFERENCES ndb.chroncontrols(chroncontrolid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.geochroncontrols ADD CONSTRAINT fk_geochroncontrols_geochronology FOREIGN KEY (geochronid) REFERENCES ndb.geochronology(geochronid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.geochroncontrols;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.geochroncontrols;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.geochroncontrols FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.geochroncontrols FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();