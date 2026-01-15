-- hiatuschronology definition

-- Drop table

-- DROP TABLE IF EXISTS hiatuschronology.hiatuschronology

CREATE TABLE hiatuschronology.hiatuschronology (
    hiatusid integer NULL,
    chronologyid integer NULL,
    hiatuslength integer NULL,
    hiatusuncertainty integer NULL,
    CONSTRAINT hiatuschronology_hiatuslength_check CHECK ((hiatuslength >= 0)),
    CONSTRAINT hiatuschronology_hiatusid_chronologyid_key UNIQUE (hiatusid, chronologyid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.hiatuschronology ADD CONSTRAINT hiatuschronology_chronologyid_fkey FOREIGN KEY (chronologyid) REFERENCES ndb.chronologies(chronologyid);
ALTER TABLE ndb.hiatuschronology ADD CONSTRAINT hiatuschronology_hiatusid_fkey FOREIGN KEY (hiatusid) REFERENCES ndb.hiatuses(hiatusid);