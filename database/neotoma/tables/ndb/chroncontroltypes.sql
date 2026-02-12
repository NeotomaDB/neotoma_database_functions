-- ndb.chroncontroltypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.chroncontroltypes

CREATE TABLE IF NOT EXISTS ndb.chroncontroltypes (

    chroncontroltypeid integer DEFAULT nextval('ndb.seq_chroncontroltypes_chroncontroltypeid'::regclass) NOT NULL,
    chroncontroltype character varying(64) NULL,
    higherchroncontroltypeid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.chroncontroltypes IS 'Lookup table of Chronology Control Types. This table is referenced by the ChronControls table.';
COMMENT ON COLUMN ndb.chroncontroltypes.chroncontroltypeid IS 'An arbitrary Chronology Control Type identification number.';
COMMENT ON COLUMN ndb.chroncontroltypes.chroncontroltype IS 'The Chronology Control Type. Chronology Controls include such geophysical controls as radiocarbon dates, calibrated radiocarbon dates, averages of several radiocarbon dates, potassium-argon dates, and thermoluminescence dates, as well as biostratigraphic controls, sediment stratigraphic controls, volcanic tephras, archaeological cultural associations, and any other types of age controls.';
COMMENT ON COLUMN ndb.chroncontroltypes.higherchroncontroltypeid IS '';
COMMENT ON COLUMN ndb.chroncontroltypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.chroncontroltypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX chroncontroltypes_pkey ON ndb.chroncontroltypes USING btree (chroncontroltypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.chroncontroltypes DROP CONSTRAINT IF EXISTS chroncontroltypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.chroncontroltypes ADD CONSTRAINT chroncontroltypes_pkey PRIMARY KEY (chroncontroltypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.chroncontroltypes ADD CONSTRAINT fk_higherchroncontroltypeid FOREIGN KEY (higherchroncontroltypeid) REFERENCES ndb.chroncontroltypes(chroncontroltypeid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chroncontroltypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chroncontroltypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.chroncontroltypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.chroncontroltypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n