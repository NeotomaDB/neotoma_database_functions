-- ndb.rocktypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.rocktypes

CREATE TABLE IF NOT EXISTS ndb.rocktypes (

    rocktypeid integer DEFAULT nextval('ndb.seq_rocktypes_rocktypeid'::regclass) NOT NULL,
    rocktype character varying(64) NOT NULL,
    higherrocktypeid integer NOT NULL,
    description text NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.rocktypes IS '';
COMMENT ON COLUMN ndb.rocktypes.rocktypeid IS '';
COMMENT ON COLUMN ndb.rocktypes.rocktype IS '';
COMMENT ON COLUMN ndb.rocktypes.higherrocktypeid IS '';
COMMENT ON COLUMN ndb.rocktypes.description IS '';
COMMENT ON COLUMN ndb.rocktypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.rocktypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX rocktypes_pkey ON ndb.rocktypes USING btree (rocktypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.rocktypes DROP CONSTRAINT IF EXISTS rocktypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.rocktypes ADD CONSTRAINT rocktypes_pkey PRIMARY KEY (rocktypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.rocktypes ADD CONSTRAINT fk_higherrocktypeid FOREIGN KEY (higherrocktypeid) REFERENCES ndb.rocktypes(rocktypeid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.rocktypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.rocktypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.rocktypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.rocktypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n