-- ndb.lakeparameters Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.lakeparameters

CREATE TABLE IF NOT EXISTS ndb.lakeparameters (

    siteid integer NOT NULL,
    lakeparameterid integer NOT NULL,
    value double precision NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.lakeparameters IS "";

--- Table indices
CREATE UNIQUE INDEX lakeparameters_pkey ON ndb.lakeparameters USING btree (siteid, lakeparameterid);
CREATE INDEX ix_lakeparameterid_lakeparameters ON ndb.lakeparameters USING btree (lakeparameterid) WITH (fillfactor='10');
CREATE INDEX ix_siteid_lakeparameters ON ndb.lakeparameters USING btree (siteid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.lakeparameters DROP CONSTRAINT IF EXISTS lakeparameters_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.lakeparameters ADD CONSTRAINT lakeparameters_pkey PRIMARY KEY (siteid, lakeparameterid);

--- Foreign Key Restraints
ALTER TABLE ndb.lakeparameters ADD CONSTRAINT fk_lakeparameters_lakeparametertypes FOREIGN KEY (lakeparameterid) REFERENCES ndb.lakeparametertypes(lakeparameterid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.lakeparameters ADD CONSTRAINT fk_lakeparameters_sites FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.lakeparameters;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.lakeparameters;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.lakeparameters FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.lakeparameters FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();