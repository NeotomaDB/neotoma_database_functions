-- ndb.embargo Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.embargo

CREATE TABLE IF NOT EXISTS ndb.embargo (

    embargoid integer DEFAULT nextval('ndb.seq_embargo_embargoid'::regclass) NOT NULL,
    embargodate date NOT NULL,
    embargopw character varying(20) NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.embargo IS "";

--- Table indices
CREATE UNIQUE INDEX embargo_pkey ON ndb.embargo USING btree (embargoid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.embargo DROP CONSTRAINT IF EXISTS embargo_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.embargo ADD CONSTRAINT embargo_pkey PRIMARY KEY (embargoid);

--- Foreign Key Restraints

--- Triggers