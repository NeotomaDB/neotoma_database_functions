-- ndb.speleothementitystatuses Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.speleothementitystatuses

CREATE TABLE IF NOT EXISTS ndb.speleothementitystatuses (

    entitystatusid integer DEFAULT nextval('ndb.speleothementitystatuses_entitystatusid_seq'::regclass) NOT NULL,
    entitystatus text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.speleothementitystatuses IS "";

--- Table indices
CREATE UNIQUE INDEX speleothementitystatuses_pkey ON ndb.speleothementitystatuses USING btree (entitystatusid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.speleothementitystatuses DROP CONSTRAINT IF EXISTS speleothementitystatuses_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.speleothementitystatuses ADD CONSTRAINT speleothementitystatuses_pkey PRIMARY KEY (entitystatusid);

--- Foreign Key Restraints

--- Triggers