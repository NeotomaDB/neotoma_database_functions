-- accumulationrates definition

-- Drop table

-- DROP TABLE IF EXISTS accumulationrates.accumulationrates

CREATE TABLE accumulationrates.accumulationrates (
    analysisunitid integer NOT NULL,
    chronologyid integer NOT NULL,
    accumulationrate double precision NOT NULL,
    variableunitsid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT accumulationrates_pkey PRIMARY KEY (analysisunitid, chronologyid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.accumulationrates ADD CONSTRAINT fk_accumulationrates_variableunits FOREIGN KEY (variableunitsid) REFERENCES ndb.variableunits(variableunitsid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.accumulationrates ADD CONSTRAINT fk_accumulationrates_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.accumulationrates ADD CONSTRAINT fk_accumulationrates_chronologies FOREIGN KEY (chronologyid) REFERENCES ndb.chronologies(chronologyid);