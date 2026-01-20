-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.analysisunitaltdepthscales

CREATE TABLE IF NOT EXISTS ndb.analysisunitaltdepthscales (

    altdepthscaleid integer DEFAULT nextval('ndb.seq_analysisunitaltdepthscales_altdepthscaleid'::regclass) NOT NULL,
    altdepthid integer NOT NULL,
    altdepthname character varying(80) NOT NULL,
    variableunitsid integer NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.analysisunitaltdepthscales IS "";

--- Table indices
CREATE UNIQUE INDEX analysisunitaltdepthscales_pkey ON ndb.analysisunitaltdepthscales USING btree (altdepthscaleid)

--- Remove existing constraints if needed
ALTER TABLE ndb.analysisunitaltdepthscales DROP CONSTRAINT IF EXISTS analysisunitaltdepthscales_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.analysisunitaltdepthscales ADD CONSTRAINT analysisunitaltdepthscales_pkey PRIMARY KEY (altdepthscaleid);

--- Foreign Key Restraints
ALTER TABLE ndb.analysisunitaltdepthscales ADD CONSTRAINT fk_analysisunitaltdepths_variableunits FOREIGN KEY (variableunitsid) REFERENCES ndb.variableunits(variableunitsid) ON UPDATE CASCADE ON DELETE CASCADE;