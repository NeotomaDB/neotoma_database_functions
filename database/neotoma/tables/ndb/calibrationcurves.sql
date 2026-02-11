-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.calibrationcurves

CREATE TABLE IF NOT EXISTS ndb.calibrationcurves (

    calibrationcurveid integer DEFAULT nextval('ndb.seq_calibrationcurves_calibrationcurveid'::regclass) NOT NULL,
    calibrationcurve character varying(24) NOT NULL,
    publicationid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.calibrationcurves IS "";

--- Table indices
CREATE UNIQUE INDEX calibrationcurves_pkey ON ndb.calibrationcurves USING btree (calibrationcurveid)

--- Remove existing constraints if needed
ALTER TABLE ndb.calibrationcurves DROP CONSTRAINT IF EXISTS calibrationcurves_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.calibrationcurves ADD CONSTRAINT calibrationcurves_pkey PRIMARY KEY (calibrationcurveid);

--- Foreign Key Restraints
ALTER TABLE ndb.calibrationcurves ADD CONSTRAINT fk_calibrationcurves_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;