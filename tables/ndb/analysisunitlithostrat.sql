-- analysisunitlithostrat definition

-- Drop table

-- DROP TABLE IF EXISTS analysisunitlithostrat.analysisunitlithostrat

CREATE TABLE analysisunitlithostrat.analysisunitlithostrat (
    analysisunitid integer NOT NULL,
    lithostratid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT analysisunitlithostrat_pkey PRIMARY KEY (analysisunitid, lithostratid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.analysisunitlithostrat ADD CONSTRAINT fk_analysisunitlithostrat_lithostrat FOREIGN KEY (lithostratid) REFERENCES ndb.lithostrat(lithostratid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.analysisunitlithostrat ADD CONSTRAINT fk_analysisunitlithostrat_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;