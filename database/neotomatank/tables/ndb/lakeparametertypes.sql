-- ndb.lakeparametertypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.lakeparametertypes

CREATE TABLE IF NOT EXISTS ndb.lakeparametertypes (

    lakeparameterid integer DEFAULT nextval('ndb.seq_lakeparametertypes_lakeparameterid'::regclass) NOT NULL,
    lakeparametercode character varying(20) NOT NULL,
    lakeparametershortname character varying(40) NOT NULL,
    lakeparameter character varying(80) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.lakeparametertypes IS 'A set of variables associated with lakes, including area, depth and volume.';
COMMENT ON COLUMN ndb.lakeparametertypes.lakeparameterid IS 'PK: LakeParameterID';
COMMENT ON COLUMN ndb.lakeparametertypes.lakeparametercode IS 'Code espcially for data entry apps';
COMMENT ON COLUMN ndb.lakeparametertypes.lakeparametershortname IS 'Short name useful for data entry apps';
COMMENT ON COLUMN ndb.lakeparametertypes.lakeparameter IS 'Full name';
COMMENT ON COLUMN ndb.lakeparametertypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.lakeparametertypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX lakeparametertypes_pkey ON ndb.lakeparametertypes USING btree (lakeparameterid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.lakeparametertypes DROP CONSTRAINT IF EXISTS lakeparametertypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.lakeparametertypes ADD CONSTRAINT lakeparametertypes_pkey PRIMARY KEY (lakeparameterid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.lakeparametertypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.lakeparametertypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.lakeparametertypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.lakeparametertypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n