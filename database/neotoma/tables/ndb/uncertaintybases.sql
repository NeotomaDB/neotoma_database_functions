-- ndb.uncertaintybases Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.uncertaintybases

CREATE TABLE IF NOT EXISTS ndb.uncertaintybases (

    uncertaintybasisid integer DEFAULT nextval('ndb.uncertaintybases_uncertaintybasisid_seq'::regclass) NOT NULL,
    uncertaintybasis text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.uncertaintybases IS '';
COMMENT ON COLUMN ndb.uncertaintybases.uncertaintybasisid IS '';
COMMENT ON COLUMN ndb.uncertaintybases.uncertaintybasis IS '';

--- Table indices
CREATE UNIQUE INDEX uncertaintybases_pkey ON ndb.uncertaintybases USING btree (uncertaintybasisid);
CREATE UNIQUE INDEX uniquebasis ON ndb.uncertaintybases USING btree (uncertaintybasis)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.uncertaintybases DROP CONSTRAINT IF EXISTS uncertaintybases_pkey;
-- ALTER TABLE ndb.uncertaintybases DROP CONSTRAINT IF EXISTS uniquebasis;

--- Non-foreign key constraints
ALTER TABLE ndb.uncertaintybases ADD CONSTRAINT uncertaintybases_pkey PRIMARY KEY (uncertaintybasisid);
ALTER TABLE ndb.uncertaintybases ADD CONSTRAINT uniquebasis UNIQUE (uncertaintybasis);

--- Foreign Key Restraints

--- Triggers