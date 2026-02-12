-- ndb.agetypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.agetypes

CREATE TABLE IF NOT EXISTS ndb.agetypes (

    agetypeid integer DEFAULT nextval('ndb.seq_agetypes_agetypeid'::regclass) NOT NULL,
    agetype character varying(64) NOT NULL,
    precedence integer NULL,
    shortagetype character varying(32) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.agetypes IS 'Lookup table of Age Types or units. This table is referenced by the Chronologies and Geochronology tables.';
COMMENT ON COLUMN ndb.agetypes.agetypeid IS 'PK: An arbitrary Age Type identification number';
COMMENT ON COLUMN ndb.agetypes.agetype IS 'Age type or units:
* Calendar years AD/BC
* Calendar years BP
* Calibrated radiocarbon years BP
* Radiocarbon years BP
* Varve years BP';
COMMENT ON COLUMN ndb.agetypes.precedence IS '';
COMMENT ON COLUMN ndb.agetypes.shortagetype IS '';
COMMENT ON COLUMN ndb.agetypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.agetypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX agetypes_pkey ON ndb.agetypes USING btree (agetypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.agetypes DROP CONSTRAINT IF EXISTS agetypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.agetypes ADD CONSTRAINT agetypes_pkey PRIMARY KEY (agetypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.agetypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.agetypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.agetypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.agetypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n