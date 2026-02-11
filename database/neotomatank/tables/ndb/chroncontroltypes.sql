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
COMMENT ON TABLE ndb.chroncontroltypes IS "Lookup table of Chronology Control Types. This table is referenced by the ChronControls table.";

--- Table indices
CREATE UNIQUE INDEX chroncontroltypes_pkey ON ndb.chroncontroltypes USING btree (chroncontroltypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.chroncontroltypes DROP CONSTRAINT IF EXISTS chroncontroltypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.chroncontroltypes ADD CONSTRAINT chroncontroltypes_pkey PRIMARY KEY (chroncontroltypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.chroncontroltypes ADD CONSTRAINT fk_higherchroncontroltypeid FOREIGN KEY (higherchroncontroltypeid) REFERENCES ndb.chroncontroltypes(chroncontroltypeid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chroncontroltypes;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chroncontroltypes;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.chroncontroltypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.chroncontroltypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();