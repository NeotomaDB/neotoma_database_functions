-- ndb.isobiomarkertypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isobiomarkertypes

CREATE TABLE IF NOT EXISTS ndb.isobiomarkertypes (

    isobiomarkertypeid integer DEFAULT nextval('ndb.seq_isobiomarkertypes_isobiomarkertypeid'::regclass) NOT NULL,
    isobiomarkertype character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.isobiomarkertypes IS '';
COMMENT ON COLUMN ndb.isobiomarkertypes.isobiomarkertypeid IS '';
COMMENT ON COLUMN ndb.isobiomarkertypes.isobiomarkertype IS '';
COMMENT ON COLUMN ndb.isobiomarkertypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.isobiomarkertypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX isobiomarkertypes_pkey ON ndb.isobiomarkertypes USING btree (isobiomarkertypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.isobiomarkertypes DROP CONSTRAINT IF EXISTS isobiomarkertypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isobiomarkertypes ADD CONSTRAINT isobiomarkertypes_pkey PRIMARY KEY (isobiomarkertypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isobiomarkertypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isobiomarkertypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.isobiomarkertypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.isobiomarkertypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n