-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.analysisunitlithostrat

CREATE TABLE IF NOT EXISTS ndb.analysisunitlithostrat (

    analysisunitid integer NOT NULL,
    lithostratid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.analysisunitlithostrat IS "";

--- Table indices
CREATE UNIQUE INDEX analysisunitlithostrat_pkey ON ndb.analysisunitlithostrat USING btree (analysisunitid, lithostratid)

--- Remove existing constraints if needed
ALTER TABLE ndb.analysisunitlithostrat DROP CONSTRAINT IF EXISTS analysisunitlithostrat_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.analysisunitlithostrat ADD CONSTRAINT analysisunitlithostrat_pkey PRIMARY KEY (analysisunitid, lithostratid);

--- Foreign Key Restraints
ALTER TABLE ndb.analysisunitlithostrat ADD CONSTRAINT fk_analysisunitlithostrat_lithostrat FOREIGN KEY (lithostratid) REFERENCES ndb.lithostrat(lithostratid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.analysisunitlithostrat ADD CONSTRAINT fk_analysisunitlithostrat_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;