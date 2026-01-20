-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.hiatuschronology

CREATE TABLE IF NOT EXISTS ndb.hiatuschronology (

    hiatusid integer NULL,
    chronologyid integer NULL,
    hiatuslength integer NULL,
    hiatusuncertainty integer NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.hiatuschronology IS "";

--- Table indices
CREATE UNIQUE INDEX hiatuschronology_hiatusid_chronologyid_key ON ndb.hiatuschronology USING btree (hiatusid, chronologyid)

--- Remove existing constraints if needed
ALTER TABLE ndb.hiatuschronology DROP CONSTRAINT IF EXISTS hiatuschronology_hiatuslength_check;
ALTER TABLE ndb.hiatuschronology DROP CONSTRAINT IF EXISTS hiatuschronology_hiatusid_chronologyid_key;

--- Non-foreign key constraints
ALTER TABLE ndb.hiatuschronology ADD CONSTRAINT hiatuschronology_hiatuslength_check CHECK ((hiatuslength >= 0));
ALTER TABLE ndb.hiatuschronology ADD CONSTRAINT hiatuschronology_hiatusid_chronologyid_key UNIQUE (hiatusid, chronologyid);

--- Foreign Key Restraints
ALTER TABLE ndb.hiatuschronology ADD CONSTRAINT hiatuschronology_chronologyid_fkey FOREIGN KEY (chronologyid) REFERENCES ndb.chronologies(chronologyid);
ALTER TABLE ndb.hiatuschronology ADD CONSTRAINT hiatuschronology_hiatusid_fkey FOREIGN KEY (hiatusid) REFERENCES ndb.hiatuses(hiatusid);