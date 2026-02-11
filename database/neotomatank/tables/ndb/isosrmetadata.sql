-- ndb.isosrmetadata Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isosrmetadata

CREATE TABLE IF NOT EXISTS ndb.isosrmetadata (

    datasetid integer NOT NULL,
    variableid integer NOT NULL,
    srlocalvalue double precision NULL,
    srlocalgeolcontext text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.isosrmetadata IS "";

--- Table indices
CREATE UNIQUE INDEX isosrmetadata_pkey ON ndb.isosrmetadata USING btree (datasetid, variableid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.isosrmetadata DROP CONSTRAINT IF EXISTS isosrmetadata_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isosrmetadata ADD CONSTRAINT isosrmetadata_pkey PRIMARY KEY (datasetid, variableid);

--- Foreign Key Restraints
ALTER TABLE ndb.isosrmetadata ADD CONSTRAINT fk_isosrmetadata_variables FOREIGN KEY (variableid) REFERENCES ndb.variables(variableid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isosrmetadata ADD CONSTRAINT fk_isosrmetadata_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isosrmetadata;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isosrmetadata;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.isosrmetadata FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.isosrmetadata FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();