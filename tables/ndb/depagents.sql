-- depagents definition

-- Drop table

-- DROP TABLE IF EXISTS depagents.depagents

CREATE TABLE depagents.depagents (
    analysisunitid integer NOT NULL,
    depagentid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT depagents_pkey PRIMARY KEY (analysisunitid, depagentid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.depagents ADD CONSTRAINT fk_depagents_depagenttypes FOREIGN KEY (depagentid) REFERENCES ndb.depagenttypes(depagentid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.depagents ADD CONSTRAINT fk_depagents_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;