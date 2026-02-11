-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.specimengenbank

CREATE TABLE IF NOT EXISTS ndb.specimengenbank (

    specimenid integer NOT NULL,
    genbanknr character varying(50) NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.specimengenbank IS "";

--- Table indices
CREATE UNIQUE INDEX specimengenbank_pkey ON ndb.specimengenbank USING btree (specimenid, genbanknr)

--- Remove existing constraints if needed
ALTER TABLE ndb.specimengenbank DROP CONSTRAINT IF EXISTS specimengenbank_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.specimengenbank ADD CONSTRAINT specimengenbank_pkey PRIMARY KEY (specimenid, genbanknr);

--- Foreign Key Restraints
ALTER TABLE ndb.specimengenbank ADD CONSTRAINT fk_specimengenbank_specimens FOREIGN KEY (specimenid) REFERENCES ndb.specimens(specimenid) ON UPDATE CASCADE ON DELETE CASCADE;