-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.analysisunitaltdepths

CREATE TABLE IF NOT EXISTS ndb.analysisunitaltdepths (

    analysisunitid integer NOT NULL,
    altdepthscaleid integer NOT NULL,
    altdepth double precision NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.analysisunitaltdepths IS "";

--- Table indices
CREATE UNIQUE INDEX analysisunitaltdepths_pkey ON ndb.analysisunitaltdepths USING btree (altdepthscaleid, analysisunitid)

--- Remove existing constraints if needed
ALTER TABLE ndb.analysisunitaltdepths DROP CONSTRAINT IF EXISTS analysisunitaltdepths_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.analysisunitaltdepths ADD CONSTRAINT analysisunitaltdepths_pkey PRIMARY KEY (altdepthscaleid, analysisunitid);

--- Foreign Key Restraints
ALTER TABLE ndb.analysisunitaltdepths ADD CONSTRAINT fk_analysisunitaltdepths_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.analysisunitaltdepths ADD CONSTRAINT fk_analysisunitaltdepths_analysisunitaltdepthscales FOREIGN KEY (altdepthscaleid) REFERENCES ndb.analysisunitaltdepthscales(altdepthscaleid) ON UPDATE CASCADE ON DELETE CASCADE;