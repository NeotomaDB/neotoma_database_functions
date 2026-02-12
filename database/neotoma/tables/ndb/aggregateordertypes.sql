-- ndb.aggregateordertypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.aggregateordertypes

CREATE TABLE IF NOT EXISTS ndb.aggregateordertypes (

    aggregateordertypeid integer DEFAULT nextval('ndb.seq_aggregateordertypes_aggregateordertypeid'::regclass) NOT NULL,
    aggregateordertype character varying(64) NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.aggregateordertypes IS 'Lookup table for Aggregate Order Types. Table is referenced by the AggregateDatasets table.';
COMMENT ON COLUMN ndb.aggregateordertypes.aggregateordertypeid IS 'An arbitrary Aggregate Order Type identification number.';
COMMENT ON COLUMN ndb.aggregateordertypes.aggregateordertype IS 'The Aggregate Order Type.';
COMMENT ON COLUMN ndb.aggregateordertypes.notes IS 'Free form notes or comments about the Aggregate Order Type.';
COMMENT ON COLUMN ndb.aggregateordertypes.recdatecreated IS '';
COMMENT ON COLUMN ndb.aggregateordertypes.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX aggregateordertypes_pkey ON ndb.aggregateordertypes USING btree (aggregateordertypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.aggregateordertypes DROP CONSTRAINT IF EXISTS aggregateordertypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.aggregateordertypes ADD CONSTRAINT aggregateordertypes_pkey PRIMARY KEY (aggregateordertypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.aggregateordertypes;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.aggregateordertypes;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.aggregateordertypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.aggregateordertypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n