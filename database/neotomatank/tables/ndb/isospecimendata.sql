-- ndb.isospecimendata Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isospecimendata

CREATE TABLE IF NOT EXISTS ndb.isospecimendata (

    isospecimendataid integer DEFAULT nextval('ndb.seq_isospecimendata_isospecimendataid'::regclass) NOT NULL,
    dataid integer NOT NULL,
    specimenid integer NOT NULL,
    sd double precision NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.isospecimendata IS '';
COMMENT ON COLUMN ndb.isospecimendata.isospecimendataid IS '';
COMMENT ON COLUMN ndb.isospecimendata.dataid IS '';
COMMENT ON COLUMN ndb.isospecimendata.specimenid IS '';
COMMENT ON COLUMN ndb.isospecimendata.sd IS '';
COMMENT ON COLUMN ndb.isospecimendata.recdatecreated IS '';
COMMENT ON COLUMN ndb.isospecimendata.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX isospecimendata_pkey ON ndb.isospecimendata USING btree (isospecimendataid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.isospecimendata DROP CONSTRAINT IF EXISTS isospecimendata_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isospecimendata ADD CONSTRAINT isospecimendata_pkey PRIMARY KEY (isospecimendataid);

--- Foreign Key Restraints
ALTER TABLE ndb.isospecimendata ADD CONSTRAINT fk_isospecimendata_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isospecimendata ADD CONSTRAINT fk_isospecimendata_specimens FOREIGN KEY (specimenid) REFERENCES ndb.specimens(specimenid) ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isospecimendata;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isospecimendata;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.isospecimendata FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.isospecimendata FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n