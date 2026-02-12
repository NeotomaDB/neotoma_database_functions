-- ndb.entitysamples Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.entitysamples

CREATE TABLE IF NOT EXISTS ndb.entitysamples (

    entityid integer NOT NULL,
    organics boolean NULL,
    fluid_inclusions boolean NULL,
    mineralogy_petrology_fabric boolean NULL,
    clumped_isotopes boolean NULL,
    noble_gas_temperatures boolean NULL,
    c14 boolean NULL,
    odl boolean NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.entitysamples IS '';
COMMENT ON COLUMN ndb.entitysamples.entityid IS '';
COMMENT ON COLUMN ndb.entitysamples.organics IS '';
COMMENT ON COLUMN ndb.entitysamples.fluid_inclusions IS '';
COMMENT ON COLUMN ndb.entitysamples.mineralogy_petrology_fabric IS '';
COMMENT ON COLUMN ndb.entitysamples.clumped_isotopes IS '';
COMMENT ON COLUMN ndb.entitysamples.noble_gas_temperatures IS '';
COMMENT ON COLUMN ndb.entitysamples.c14 IS '';
COMMENT ON COLUMN ndb.entitysamples.odl IS '';

--- Table indices
CREATE UNIQUE INDEX entitysamples_pkey ON ndb.entitysamples USING btree (entityid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.entitysamples DROP CONSTRAINT IF EXISTS entitysamples_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.entitysamples ADD CONSTRAINT entitysamples_pkey PRIMARY KEY (entityid);

--- Foreign Key Restraints
ALTER TABLE ndb.entitysamples ADD CONSTRAINT entitysamples_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid);

--- Triggers