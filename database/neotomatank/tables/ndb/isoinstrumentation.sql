-- ndb.isoinstrumentation Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isoinstrumentation

CREATE TABLE IF NOT EXISTS ndb.isoinstrumentation (

    datasetid integer NOT NULL,
    variableid integer NOT NULL,
    isoinstrumentationtypeid integer NULL,
    isosampleintrosystemtypeid integer NULL,
    insterrorpercent double precision NULL,
    insterrorrunsd double precision NULL,
    insterrorlongtermpercent double precision NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.isoinstrumentation IS "";

--- Table indices
CREATE UNIQUE INDEX isoinstrumentation_pkey ON ndb.isoinstrumentation USING btree (datasetid, variableid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.isoinstrumentation DROP CONSTRAINT IF EXISTS isoinstrumentation_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isoinstrumentation ADD CONSTRAINT isoinstrumentation_pkey PRIMARY KEY (datasetid, variableid);

--- Foreign Key Restraints
ALTER TABLE ndb.isoinstrumentation ADD CONSTRAINT fk_isoinstrumentation_isoinstrumentationtypes FOREIGN KEY (isoinstrumentationtypeid) REFERENCES ndb.isoinstrumentationtypes(isoinstrumentationtypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isoinstrumentation ADD CONSTRAINT fk_isoinstrumentation_isosampleintrosystemtypes FOREIGN KEY (isosampleintrosystemtypeid) REFERENCES ndb.isosampleintrosystemtypes(isosampleintrosystemtypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isoinstrumentation ADD CONSTRAINT fk_isoinstrumentation_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isoinstrumentation ADD CONSTRAINT fk_isoinstrumentation_variables FOREIGN KEY (variableid) REFERENCES ndb.variables(variableid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isoinstrumentation;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isoinstrumentation;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.isoinstrumentation FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.isoinstrumentation FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();