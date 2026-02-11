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
COMMENT ON TABLE ndb.aggregateordertypes IS "Lookup table for Aggregate Order Types. Table is referenced by the AggregateDatasets table.";

--- Table indices
CREATE UNIQUE INDEX aggregateordertypes_pkey ON ndb.aggregateordertypes USING btree (aggregateordertypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.aggregateordertypes DROP CONSTRAINT IF EXISTS aggregateordertypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.aggregateordertypes ADD CONSTRAINT aggregateordertypes_pkey PRIMARY KEY (aggregateordertypeid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.aggregateordertypes;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.aggregateordertypes;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.aggregateordertypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.aggregateordertypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();