-- ndb.depthreferencesystem Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.depthreferencesystem

CREATE TABLE IF NOT EXISTS ndb.depthreferencesystem (

    depthreferencesystemid integer DEFAULT nextval('ndb.depthreferencesystem_depthreferencesystemid_seq'::regclass) NOT NULL,
    depthreference text NULL,
    depthreferencenotes text NULL,
    depthreferencepublicationid integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.depthreferencesystem IS '';
COMMENT ON COLUMN ndb.depthreferencesystem.depthreferencesystemid IS '';
COMMENT ON COLUMN ndb.depthreferencesystem.depthreference IS '';
COMMENT ON COLUMN ndb.depthreferencesystem.depthreferencenotes IS '';
COMMENT ON COLUMN ndb.depthreferencesystem.depthreferencepublicationid IS '';

--- Table indices
CREATE UNIQUE INDEX depthreferencesystem_pkey ON ndb.depthreferencesystem USING btree (depthreferencesystemid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.depthreferencesystem DROP CONSTRAINT IF EXISTS depthreferencesystem_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.depthreferencesystem ADD CONSTRAINT depthreferencesystem_pkey PRIMARY KEY (depthreferencesystemid);

--- Foreign Key Restraints
ALTER TABLE ndb.depthreferencesystem ADD CONSTRAINT depthreferencesystem_depthreferencepublicationid_fkey FOREIGN KEY (depthreferencepublicationid) REFERENCES ndb.publications(publicationid);

--- Triggers