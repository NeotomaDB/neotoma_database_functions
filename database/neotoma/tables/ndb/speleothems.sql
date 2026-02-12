-- ndb.speleothems Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.speleothems

CREATE TABLE IF NOT EXISTS ndb.speleothems (

    siteid integer NULL,
    entityid integer DEFAULT nextval('ndb.speleothems_entityid_seq'::regclass) NOT NULL,
    entityname text NULL,
    monitoring boolean NULL,
    rockageid integer NULL,
    entrancedistance real NULL,
    entrancedistanceunits integer NULL,
    speleothemtypeid integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.speleothems IS '';
COMMENT ON COLUMN ndb.speleothems.siteid IS '';
COMMENT ON COLUMN ndb.speleothems.entityid IS '';
COMMENT ON COLUMN ndb.speleothems.entityname IS '';
COMMENT ON COLUMN ndb.speleothems.monitoring IS '';
COMMENT ON COLUMN ndb.speleothems.rockageid IS '';
COMMENT ON COLUMN ndb.speleothems.entrancedistance IS '';
COMMENT ON COLUMN ndb.speleothems.entrancedistanceunits IS '';
COMMENT ON COLUMN ndb.speleothems.speleothemtypeid IS '';

--- Table indices
CREATE UNIQUE INDEX speleothems_pkey ON ndb.speleothems USING btree (entityid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.speleothems DROP CONSTRAINT IF EXISTS speleothems_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.speleothems ADD CONSTRAINT speleothems_pkey PRIMARY KEY (entityid);

--- Foreign Key Restraints
ALTER TABLE ndb.speleothems ADD CONSTRAINT speleothems_speleothemtypeid_fkey FOREIGN KEY (speleothemtypeid) REFERENCES ndb.speleothemtypes(speleothemtypeid);
ALTER TABLE ndb.speleothems ADD CONSTRAINT speleothems_entrancedistanceunits_fkey FOREIGN KEY (entrancedistanceunits) REFERENCES ndb.variableunits(variableunitsid);
ALTER TABLE ndb.speleothems ADD CONSTRAINT speleothems_rockageid_fkey FOREIGN KEY (rockageid) REFERENCES ndb.relativeages(relativeageid);
ALTER TABLE ndb.speleothems ADD CONSTRAINT speleothems_siteid_fkey FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON DELETE CASCADE;

--- Triggers