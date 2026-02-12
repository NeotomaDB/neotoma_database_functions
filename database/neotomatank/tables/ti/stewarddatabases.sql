-- ti.stewarddatabases Table definition

-- Drop table

-- DROP TABLE IF EXISTS ti.stewarddatabases

CREATE TABLE IF NOT EXISTS ti.stewarddatabases (

    stewardid integer NOT NULL,
    databaseid integer NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ti.stewarddatabases IS '';
COMMENT ON COLUMN ti.stewarddatabases.stewardid IS '';
COMMENT ON COLUMN ti.stewarddatabases.databaseid IS '';

--- Table indices
CREATE UNIQUE INDEX stewarddatabases_pkey ON ti.stewarddatabases USING btree (stewardid, databaseid)

--- Remove existing constraints if needed
-- ALTER TABLE ti.stewarddatabases DROP CONSTRAINT IF EXISTS stewarddatabases_pkey;

--- Non-foreign key constraints
ALTER TABLE ti.stewarddatabases ADD CONSTRAINT stewarddatabases_pkey PRIMARY KEY (stewardid, databaseid);

--- Foreign Key Restraints
ALTER TABLE ti.stewarddatabases ADD CONSTRAINT fk_stewarddatabases_constituentdatabases FOREIGN KEY (databaseid) REFERENCES ndb.constituentdatabases(databaseid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ti.stewarddatabases ADD CONSTRAINT fk_stewarddatabases_stewards FOREIGN KEY (stewardid) REFERENCES ti.stewards(stewardid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers