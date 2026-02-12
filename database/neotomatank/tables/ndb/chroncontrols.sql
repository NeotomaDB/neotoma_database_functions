-- ndb.chroncontrols Table definition

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


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.chroncontrols IS 'This table stores data for Chronology Controls, which are the age-depth control points used for age models. These controls may be geophysical controls, such as radiocarbon dates, but include many other kinds of age controls, such as biostratigraphic controls, archaeological cultural associations, and volcanic tephras. In the case of radiocarbon dates, a Chronology Control may not simply be the raw radiocarbon date reported by the laboratory, but perhaps a radiocarbon date corrected for an old carbon reservoir, a calibrated radiocarbon date, or an average of several radiocarbon dates from the same level. A common control for lake-sediment cores is the age of the top of the core, which may be the year the core was taken or perhaps an estimate of 0 BP if a few cm of surficial sediment were lost.';
COMMENT ON COLUMN ndb.chroncontrols.chroncontrolid IS 'An arbitrary Chronology Control identification number.';
COMMENT ON COLUMN ndb.chroncontrols.chronologyid IS 'Chronology to which the ChronControl belongs. Field links to the Chronolgies table.';
COMMENT ON COLUMN ndb.chroncontrols.chroncontroltypeid IS 'The type of Chronology Control. Field links to the ChronControlTypes table.';
COMMENT ON COLUMN ndb.chroncontrols.depth IS 'Depth of the Chronology Control in cm.';
COMMENT ON COLUMN ndb.chroncontrols.thickness IS 'Thickness of the Chronology Control in cm.';
COMMENT ON COLUMN ndb.chroncontrols.age IS 'Age of the Chronology Control.';
COMMENT ON COLUMN ndb.chroncontrols.agelimityounger IS 'The younger age limit of a Chronology Control. This limit may be explicitly defined, for example the younger of the 2-sigma range limits of a calibrated radiocarbon date, or it may be more loosely defined, for example the younger limit on the range of dates for a biostratigraphic horizon.';
COMMENT ON COLUMN ndb.chroncontrols.agelimitolder IS 'The older age limit of a Chronology Control.';
COMMENT ON COLUMN ndb.chroncontrols.notes IS 'Free form notes or comments about the Chronology Control.';
COMMENT ON COLUMN ndb.chroncontrols.recdatecreated IS '';
COMMENT ON COLUMN ndb.chroncontrols.recdatemodified IS '';
COMMENT ON COLUMN ndb.chroncontrols.analysisunitid IS '';
COMMENT ON COLUMN ndb.chroncontrols.agetypeid IS '';

--- Table indices
CREATE UNIQUE INDEX chroncontrols_pkey ON ndb.chroncontrols USING btree (chroncontrolid);
CREATE INDEX ccrchronage_idx ON ndb.chroncontrols USING btree (age);
CREATE INDEX ccroldage_idx ON ndb.chroncontrols USING btree (agelimitolder);
CREATE INDEX ccryoungage_idx ON ndb.chroncontrols USING btree (agelimityounger);
CREATE INDEX chroncontrols_chronologyid_idx ON ndb.chroncontrols USING btree (chronologyid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.chroncontrols DROP CONSTRAINT IF EXISTS chroncontrols_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.chroncontrols ADD CONSTRAINT chroncontrols_pkey PRIMARY KEY (chroncontrolid);

--- Foreign Key Restraints
ALTER TABLE ndb.chroncontrols ADD CONSTRAINT fk_chroncontrols_chroncontroltypes FOREIGN KEY (chroncontroltypeid) REFERENCES ndb.chroncontroltypes(chroncontroltypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrols ADD CONSTRAINT fk_chroncontrols_chronologies FOREIGN KEY (chronologyid) REFERENCES ndb.chronologies(chronologyid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrols ADD CONSTRAINT fk_chroncontrols_analysisunits FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrols ADD CONSTRAINT fk_chroncontrols_agetypes FOREIGN KEY (agetypeid) REFERENCES ndb.agetypes(agetypeid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chroncontrols;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chroncontrols;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.chroncontrols FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.chroncontrols FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n