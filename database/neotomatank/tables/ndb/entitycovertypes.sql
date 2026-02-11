-- ndb.entitycovertypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.entitycovertypes

CREATE TABLE IF NOT EXISTS ndb.entitycovertypes (

    entitycoverid integer DEFAULT nextval('ndb.entitycovertypes_entitycoverid_seq'::regclass) NOT NULL,
    entitycovertype character varying(50) NULL,
    entitycovernotes text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.entitycovertypes IS "";

--- Table indices
CREATE UNIQUE INDEX entitycovertypes_pkey ON ndb.entitycovertypes USING btree (entitycoverid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.entitycovertypes DROP CONSTRAINT IF EXISTS entitycovertypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.entitycovertypes ADD CONSTRAINT entitycovertypes_pkey PRIMARY KEY (entitycoverid);

--- Foreign Key Restraints

--- Triggers