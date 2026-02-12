-- ndb.publicationtypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.publicationtypes

CREATE TABLE IF NOT EXISTS ndb.publicationtypes (

    pubtypeid integer DEFAULT nextval('ndb.seq_publicationtypes_pubtypeid'::regclass) NOT NULL,
    pubtype character varying(24) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.publicationtypes IS 'Lookup table of Publication Types. This table is referenced by the Publications table.';
COMMENT ON COLUMN ndb.publicationtypes.pubtypeid IS 'An arbitrary Publication Type identification number.';
COMMENT ON COLUMN ndb.publicationtypes.pubtype IS '';
COMMENT ON COLUMN ndb.publicationtypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.publicationtypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX publicationtypes_pkey ON ndb.publicationtypes USING btree (pubtypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.publicationtypes DROP CONSTRAINT IF EXISTS publicationtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.publicationtypes ADD CONSTRAINT publicationtypes_pkey PRIMARY KEY (pubtypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.publicationtypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.publicationtypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.publicationtypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.publicationtypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n