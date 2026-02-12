-- ndb.elementtypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.elementtypes

CREATE TABLE IF NOT EXISTS ndb.elementtypes (

    elementtypeid integer DEFAULT nextval('ndb.seq_elementtypes_elementtypeid'::regclass) NOT NULL,
    elementtype character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.elementtypes IS '';
COMMENT ON COLUMN ndb.elementtypes.elementtypeid IS '';
COMMENT ON COLUMN ndb.elementtypes.elementtype IS '';
COMMENT ON COLUMN ndb.elementtypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.elementtypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX elementtypes_pkey ON ndb.elementtypes USING btree (elementtypeid);
CREATE UNIQUE INDEX ix_elementtypes ON ndb.elementtypes USING btree (elementtype) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.elementtypes DROP CONSTRAINT IF EXISTS elementtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.elementtypes ADD CONSTRAINT elementtypes_pkey PRIMARY KEY (elementtypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.elementtypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.elementtypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.elementtypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.elementtypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n