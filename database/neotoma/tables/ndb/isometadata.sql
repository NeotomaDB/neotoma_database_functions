-- ndb.isometadata Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isometadata

CREATE TABLE IF NOT EXISTS ndb.isometadata (

    isometadataid integer DEFAULT nextval('ndb.seq_isometadata_isometadataid'::regclass) NOT NULL,
    dataid integer NOT NULL,
    isomatanaltypeid integer NULL,
    isosubstratetypeid integer NULL,
    analystid integer NULL,
    lab character varying(255) NULL,
    labnumber character varying(64) NULL,
    mass_mg double precision NULL,
    weightpercent double precision NULL,
    atomicpercent double precision NULL,
    reps integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.isometadata IS '';
COMMENT ON COLUMN ndb.isometadata.isometadataid IS '';
COMMENT ON COLUMN ndb.isometadata.dataid IS '';
COMMENT ON COLUMN ndb.isometadata.isomatanaltypeid IS '';
COMMENT ON COLUMN ndb.isometadata.isosubstratetypeid IS '';
COMMENT ON COLUMN ndb.isometadata.analystid IS '';
COMMENT ON COLUMN ndb.isometadata.lab IS '';
COMMENT ON COLUMN ndb.isometadata.labnumber IS '';
COMMENT ON COLUMN ndb.isometadata.mass_mg IS '';
COMMENT ON COLUMN ndb.isometadata.weightpercent IS '';
COMMENT ON COLUMN ndb.isometadata.atomicpercent IS '';
COMMENT ON COLUMN ndb.isometadata.reps IS '';
COMMENT ON COLUMN ndb.isometadata.recdatecreated IS '';
COMMENT ON COLUMN ndb.isometadata.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX isometadata_pkey ON ndb.isometadata USING btree (isometadataid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.isometadata DROP CONSTRAINT IF EXISTS isometadata_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isometadata ADD CONSTRAINT isometadata_pkey PRIMARY KEY (isometadataid);

--- Foreign Key Restraints
ALTER TABLE ndb.isometadata ADD CONSTRAINT fk_isometadata_contacts FOREIGN KEY (analystid) REFERENCES ndb.contacts(contactid);
ALTER TABLE ndb.isometadata ADD CONSTRAINT fk_isometadata_isomaterialanalyzedtypes FOREIGN KEY (isomatanaltypeid) REFERENCES ndb.isomaterialanalyzedtypes(isomatanaltypeid) ON DELETE SET NULL;
ALTER TABLE ndb.isometadata ADD CONSTRAINT fk_isometadata_isosubstratetypes FOREIGN KEY (isosubstratetypeid) REFERENCES ndb.isosubstratetypes(isosubstratetypeid) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE ndb.isometadata ADD CONSTRAINT fk_isometadata_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isometadata;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isometadata;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.isometadata FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.isometadata FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n