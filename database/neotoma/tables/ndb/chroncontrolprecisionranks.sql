-- ndb.chroncontrolprecisionranks Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.chroncontrolprecisionranks

CREATE TABLE IF NOT EXISTS ndb.chroncontrolprecisionranks (

    precisionrankid integer DEFAULT nextval('ndb.seq_chroncontrolprecisionranks_precisionrankid'::regclass) NOT NULL,
    precisionrank character varying(255) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.chroncontrolprecisionranks IS '';
COMMENT ON COLUMN ndb.chroncontrolprecisionranks.precisionrankid IS '';
COMMENT ON COLUMN ndb.chroncontrolprecisionranks.precisionrank IS '';
COMMENT ON COLUMN ndb.chroncontrolprecisionranks.recdatecreated IS '';
COMMENT ON COLUMN ndb.chroncontrolprecisionranks.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX chroncontrolprecisionranks_pkey ON ndb.chroncontrolprecisionranks USING btree (precisionrankid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.chroncontrolprecisionranks DROP CONSTRAINT IF EXISTS chroncontrolprecisionranks_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.chroncontrolprecisionranks ADD CONSTRAINT chroncontrolprecisionranks_pkey PRIMARY KEY (precisionrankid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chroncontrolprecisionranks;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chroncontrolprecisionranks;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.chroncontrolprecisionranks FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.chroncontrolprecisionranks FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n