-- hiatuses definition

-- Drop table

-- DROP TABLE IF EXISTS hiatuses.hiatuses

CREATE TABLE hiatuses.hiatuses (
    hiatusid integer DEFAULT nextval('ndb.hiatuses_hiatusid_seq'::regclass) NOT NULL,
    analysisunitstart integer NULL,
    analysisunitend integer NULL,
    notes text NULL,
    CONSTRAINT hiatuses_pkey PRIMARY KEY (hiatusid),
    CONSTRAINT hiatuses_hiatusid_analysisunitstart_analysisunitend_key UNIQUE (hiatusid, analysisunitstart, analysisunitend)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.hiatuses ADD CONSTRAINT hiatuses_analysisunitstart_fkey FOREIGN KEY (analysisunitstart) REFERENCES ndb.analysisunits(analysisunitid);
ALTER TABLE ndb.hiatuses ADD CONSTRAINT hiatuses_analysisunitend_fkey FOREIGN KEY (analysisunitend) REFERENCES ndb.analysisunits(analysisunitid);