-- ndb.speleothemtypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.speleothemtypes

CREATE TABLE IF NOT EXISTS ndb.speleothemtypes (

    speleothemtypeid integer DEFAULT nextval('ndb.speleothemtypes_speleothemtypeid_seq'::regclass) NOT NULL,
    speleothemtype character varying(50) NULL,
    speleothemtypenotes text NULL,
    speleothemtypepublicationid integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.speleothemtypes IS '';
COMMENT ON COLUMN ndb.speleothemtypes.speleothemtypeid IS '';
COMMENT ON COLUMN ndb.speleothemtypes.speleothemtype IS '';
COMMENT ON COLUMN ndb.speleothemtypes.speleothemtypenotes IS '';
COMMENT ON COLUMN ndb.speleothemtypes.speleothemtypepublicationid IS '';

--- Table indices
CREATE UNIQUE INDEX speleothemtypes_pkey ON ndb.speleothemtypes USING btree (speleothemtypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.speleothemtypes DROP CONSTRAINT IF EXISTS speleothemtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.speleothemtypes ADD CONSTRAINT speleothemtypes_pkey PRIMARY KEY (speleothemtypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.speleothemtypes ADD CONSTRAINT speleothemtypes_speleothemtypepublicationid_fkey FOREIGN KEY (speleothemtypepublicationid) REFERENCES ndb.publications(publicationid);

--- Triggers