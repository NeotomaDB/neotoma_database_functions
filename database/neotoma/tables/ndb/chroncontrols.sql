-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.chroncontrols

CREATE TABLE IF NOT EXISTS ndb.chroncontrols (

    chroncontrolid integer DEFAULT nextval('ndb.seq_chroncontrols_chroncontrolid'::regclass) NOT NULL,
    chronologyid integer NOT NULL,
    chroncontroltypeid integer NULL,
    depth double precision NULL,
    thickness double precision NULL,
    age double precision NULL,
    agelimityounger double precision NULL,
    agelimitolder double precision NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    analysisunitid integer NULL,
    agetypeid integer NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.chroncontrols IS "This table stores data for Chronology Controls, which are the age-depth control points used for age models. These controls may be geophysical controls, such as radiocarbon dates, but include many other kinds of age controls, such as biostratigraphic controls, archaeological cultural associations, and volcanic tephras. In the case of radiocarbon dates, a Chronology Control may not simply be the raw radiocarbon date reported by the laboratory, but perhaps a radiocarbon date corrected for an old carbon reservoir, a calibrated radiocarbon date, or an average of several radiocarbon dates from the same level. A common control for lake-sediment cores is the age of the top of the core, which may be the year the core was taken or perhaps an estimate of 0 BP if a few cm of surficial sediment were lost.";

--- Table indices
CREATE UNIQUE INDEX chroncontrols_pkey ON ndb.chroncontrols USING btree (chroncontrolid);
CREATE INDEX ccrchronage_idx ON ndb.chroncontrols USING btree (age);
CREATE INDEX ccroldage_idx ON ndb.chroncontrols USING btree (agelimitolder);
CREATE INDEX ccryoungage_idx ON ndb.chroncontrols USING btree (agelimityounger);
CREATE INDEX chroncontrols_chronologyid_idx ON ndb.chroncontrols USING btree (chronologyid)

--- Remove existing constraints if needed
ALTER TABLE ndb.chroncontrols DROP CONSTRAINT IF EXISTS chroncontrols_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.chroncontrols ADD CONSTRAINT chroncontrols_pkey PRIMARY KEY (chroncontrolid);

--- Foreign Key Restraints
ALTER TABLE ndb.chroncontrols ADD CONSTRAINT fk_chroncontrols_agetypes FOREIGN KEY (agetypeid) REFERENCES ndb.agetypes(agetypeid);
ALTER TABLE ndb.chroncontrols ADD CONSTRAINT fk_chroncontrols_chroncontroltypes FOREIGN KEY (chroncontroltypeid) REFERENCES ndb.chroncontroltypes(chroncontroltypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrols ADD CONSTRAINT fk_chroncontrols_chronologies FOREIGN KEY (chronologyid) REFERENCES ndb.chronologies(chronologyid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrols ADD CONSTRAINT fk_chroncontrols_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;