-- ndb.hiatuses Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.hiatuses

CREATE TABLE IF NOT EXISTS ndb.hiatuses (

    hiatusid integer DEFAULT nextval('ndb.hiatuses_hiatusid_seq'::regclass) NOT NULL,
    analysisunitstart integer NULL,
    analysisunitend integer NULL,
    notes text NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.hiatuses IS '';
COMMENT ON COLUMN ndb.hiatuses.hiatusid IS '';
COMMENT ON COLUMN ndb.hiatuses.analysisunitstart IS '';
COMMENT ON COLUMN ndb.hiatuses.analysisunitend IS '';
COMMENT ON COLUMN ndb.hiatuses.notes IS '';

--- Table indices
CREATE UNIQUE INDEX hiatuses_pkey ON ndb.hiatuses USING btree (hiatusid);
CREATE UNIQUE INDEX hiatuses_hiatusid_analysisunitstart_analysisunitend_key ON ndb.hiatuses USING btree (hiatusid, analysisunitstart, analysisunitend)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.hiatuses DROP CONSTRAINT IF EXISTS hiatuses_pkey;
-- ALTER TABLE ndb.hiatuses DROP CONSTRAINT IF EXISTS hiatuses_hiatusid_analysisunitstart_analysisunitend_key;

--- Non-foreign key constraints
ALTER TABLE ndb.hiatuses ADD CONSTRAINT hiatuses_pkey PRIMARY KEY (hiatusid);
ALTER TABLE ndb.hiatuses ADD CONSTRAINT hiatuses_hiatusid_analysisunitstart_analysisunitend_key UNIQUE (hiatusid, analysisunitstart, analysisunitend);

--- Foreign Key Restraints
ALTER TABLE ndb.hiatuses ADD CONSTRAINT hiatuses_analysisunitstart_fkey FOREIGN KEY (analysisunitstart) REFERENCES ndb.analysisunits(analysisunitid);
ALTER TABLE ndb.hiatuses ADD CONSTRAINT hiatuses_analysisunitend_fkey FOREIGN KEY (analysisunitend) REFERENCES ndb.analysisunits(analysisunitid);

--- Triggers