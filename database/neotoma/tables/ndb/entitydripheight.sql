-- ndb.entitydripheight Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.entitydripheight

CREATE TABLE IF NOT EXISTS ndb.entitydripheight (

    entityid integer NULL,
    speleothemdriptypeid integer NULL,
    entitydripheight real NULL,
    entitydripheightunit integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.entitydripheight IS '';
COMMENT ON COLUMN ndb.entitydripheight.entityid IS '';
COMMENT ON COLUMN ndb.entitydripheight.speleothemdriptypeid IS '';
COMMENT ON COLUMN ndb.entitydripheight.entitydripheight IS '';
COMMENT ON COLUMN ndb.entitydripheight.entitydripheightunit IS '';

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.entitydripheight ADD CONSTRAINT entitydripheight_speleothemdriptypeid_fkey FOREIGN KEY (speleothemdriptypeid) REFERENCES ndb.speleothemdriptypes(speleothemdriptypeid);
ALTER TABLE ndb.entitydripheight ADD CONSTRAINT entitydripheight_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid) ON DELETE CASCADE;
ALTER TABLE ndb.entitydripheight ADD CONSTRAINT entitydripheight_entitydripheightunit_fkey FOREIGN KEY (entitydripheightunit) REFERENCES ndb.variableunits(variableunitsid);

--- Triggers