-- analysisunitaltdepths definition

-- Drop table

-- DROP TABLE IF EXISTS analysisunitaltdepths.analysisunitaltdepths

CREATE TABLE analysisunitaltdepths.analysisunitaltdepths (
    analysisunitid integer NOT NULL,
    altdepthscaleid integer NOT NULL,
    altdepth double precision NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT analysisunitaltdepths_pkey PRIMARY KEY (altdepthscaleid, analysisunitid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.analysisunitaltdepths ADD CONSTRAINT fk_analysisunitaltdepths_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.analysisunitaltdepths ADD CONSTRAINT fk_analysisunitaltdepths_analysisunitaltdepthscales FOREIGN KEY (altdepthscaleid) REFERENCES ndb.analysisunitaltdepthscales(altdepthscaleid) ON UPDATE CASCADE ON DELETE CASCADE;