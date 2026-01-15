-- analysisunitaltdepthscales definition

-- Drop table

-- DROP TABLE IF EXISTS analysisunitaltdepthscales.analysisunitaltdepthscales

CREATE TABLE analysisunitaltdepthscales.analysisunitaltdepthscales (
    altdepthscaleid integer DEFAULT nextval('ndb.seq_analysisunitaltdepthscales_altdepthscaleid'::regclass) NOT NULL,
    altdepthid integer NOT NULL,
    altdepthname character varying(80) NOT NULL,
    variableunitsid integer NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT analysisunitaltdepthscales_pkey PRIMARY KEY (altdepthscaleid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.analysisunitaltdepthscales ADD CONSTRAINT fk_analysisunitaltdepths_variableunits FOREIGN KEY (variableunitsid) REFERENCES ndb.variableunits(variableunitsid) ON UPDATE CASCADE ON DELETE CASCADE;