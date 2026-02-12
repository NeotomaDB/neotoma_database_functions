-- ndb.isobiomarkerbandtypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isobiomarkerbandtypes

CREATE TABLE IF NOT EXISTS ndb.isobiomarkerbandtypes (

    isobiomarkerbandtypeid integer DEFAULT nextval('ndb.seq_isobiomarkerbandtypes_isobiomarkerbandtypeid'::regclass) NOT NULL,
    isobiomarkertypeid integer NOT NULL,
    isobiomarkerbandtype character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.isobiomarkerbandtypes IS '';
COMMENT ON COLUMN ndb.isobiomarkerbandtypes.isobiomarkerbandtypeid IS '';
COMMENT ON COLUMN ndb.isobiomarkerbandtypes.isobiomarkertypeid IS '';
COMMENT ON COLUMN ndb.isobiomarkerbandtypes.isobiomarkerbandtype IS '';
COMMENT ON COLUMN ndb.isobiomarkerbandtypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.isobiomarkerbandtypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX isobiomarkerbandtypes_pkey ON ndb.isobiomarkerbandtypes USING btree (isobiomarkerbandtypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.isobiomarkerbandtypes DROP CONSTRAINT IF EXISTS isobiomarkerbandtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isobiomarkerbandtypes ADD CONSTRAINT isobiomarkerbandtypes_pkey PRIMARY KEY (isobiomarkerbandtypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.isobiomarkerbandtypes ADD CONSTRAINT fk_isobiomarkerbands_isobiomarkertypes FOREIGN KEY (isobiomarkertypeid) REFERENCES ndb.isobiomarkertypes(isobiomarkertypeid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isobiomarkerbandtypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isobiomarkerbandtypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.isobiomarkerbandtypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.isobiomarkerbandtypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n