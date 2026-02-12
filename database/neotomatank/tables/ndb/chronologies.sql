-- ndb.chronologies Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.chronologies

CREATE TABLE IF NOT EXISTS ndb.chronologies (

    chronologyid integer DEFAULT nextval('ndb.seq_chronologies_chronologyid'::regclass) NOT NULL,
    collectionunitid integer NOT NULL,
    agetypeid integer NOT NULL,
    contactid integer NULL,
    isdefault boolean NOT NULL,
    chronologyname character varying(80) NULL,
    dateprepared date NULL,
    agemodel character varying(80) NULL,
    ageboundyounger integer NULL,
    ageboundolder integer NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.chronologies IS 'This table stores Chronology data. A Chronology refers to an explicit chronology assigned to a Collection Unit. A Chronology has Chronology Controls, the actual age-depth control points, which are stored in the ChronControls table. A Chronology is also based on an Age Model, which may be a numerical method that fits a curve to a set of age-depth control points or may simply be individually dated Analysis Units.
A Collection Unit may have more than one Chronology, for example one in radiocarbon years and another in calibrated radiocarbon years. There may be a Chronology developed by the original author and another developed by a later research project. Chronologies may be stored for archival reasons, even though they are now believed to have problems, if they were used for an important research project. One Chronology per Age Type may be designated the default Chronology, which is the Chronology currently preferred by the database stewards.
Based upon the Chronology, which includes the Age Model and the Chron Controls, ages are assigned to individual samples, which are stored in the SampleAges table.
A younger and older age bounds are assigned to the Chronology. Within these bounds the Chronology is regarded as reliable. Ages may be assigned to samples beyond the reliable age bounds, but these are not considered reliable';
COMMENT ON COLUMN ndb.chronologies.chronologyid IS 'An arbitrary Chronology identification number.';
COMMENT ON COLUMN ndb.chronologies.collectionunitid IS 'Collection Unit to which the Chronology applies. Field links to the CollectionUnits table.';
COMMENT ON COLUMN ndb.chronologies.agetypeid IS 'Age type or units. Field links to the AgeTypes table.';
COMMENT ON COLUMN ndb.chronologies.contactid IS 'Person who developed the Age Model. Field links to the Contacts table.';
COMMENT ON COLUMN ndb.chronologies.isdefault IS 'Indicates whether the Chronology is a default chronology or not. Default status is determined by a Neotoma data steward. Collection Units may have more than one default Chronology, but may have only one default Chronology per Age Type. Thus, there may be a default radiocarbon year Chronology and a default calibrated radiocarbon year Chronology, but only one of each. Default Chronologies may be used by the Neotoma web site, or other web sites, for displaying default diagrams or time series of data. Default Chronologies may also be of considerable use for actual research purposes; however, users may of course choose to develop their own chronologies.';
COMMENT ON COLUMN ndb.chronologies.chronologyname IS 'Optional name for the Chronology. Some examples are:
COHMAP chron 1 A Chronology assigned by the COHMAP project.
COHMAP chron 2 An alternative Chronology assigned by the COHMAP project
NAPD 1 A Chronology assigned by the North American Pollen Database.
Gajewski 1995 A Chronology assigned by Gajewski (1995).';
COMMENT ON COLUMN ndb.chronologies.dateprepared IS 'Date that the Chronology was prepared.';
COMMENT ON COLUMN ndb.chronologies.agemodel IS 'The age model used for the Chronology. Some examples are: linear interpolation, 3rd order polynomial, and individually dated analysis units.';
COMMENT ON COLUMN ndb.chronologies.ageboundyounger IS 'The younger reliable age bound for the Chronology. Younger ages may be assigned to samples, but are not regarded as reliable. If the entire Chronology is considered reliable, AgeBoundYounger is assigned the youngest sample age rounded down to the nearest 10. Thus, for 72 BP, AgeBoundYounger = 70 BP; for -45 BP, AgeBoundYounger = -50 BP.';
COMMENT ON COLUMN ndb.chronologies.ageboundolder IS 'The older reliable age bound for the Chronology. Ages older than AgeOlderBound may be assigned to samples, but are not regarded as reliable. This situation is particularly true for ages extrapolated beyond the oldest Chron Control. . If the entire Chronology is considered reliable, AgeBoundOlder is assigned the oldest sample age rounded up to the nearest 10. Thus, for 12564 BP, AgeBoundOlder is 12570.';
COMMENT ON COLUMN ndb.chronologies.notes IS 'Free form notes or comments about the Chronology.';
COMMENT ON COLUMN ndb.chronologies.recdatecreated IS '';
COMMENT ON COLUMN ndb.chronologies.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX chronologies_pkey ON ndb.chronologies USING btree (chronologyid);
CREATE INDEX chroldage_idx ON ndb.chronologies USING btree (ageboundolder);
CREATE INDEX chryoungage_idx ON ndb.chronologies USING btree (ageboundyounger);
CREATE INDEX oldage_idx ON ndb.chronologies USING btree (ageboundolder);
CREATE INDEX youngage_idx ON ndb.chronologies USING btree (ageboundyounger);
CREATE INDEX idx_chronologies_default ON ndb.chronologies USING btree (chronologyid) WHERE (isdefault = true)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.chronologies DROP CONSTRAINT IF EXISTS chronologies_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.chronologies ADD CONSTRAINT chronologies_pkey PRIMARY KEY (chronologyid);

--- Foreign Key Restraints
ALTER TABLE ndb.chronologies ADD CONSTRAINT fk_chronologies_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;
ALTER TABLE ndb.chronologies ADD CONSTRAINT fk_chronologies_agetypes FOREIGN KEY (agetypeid) REFERENCES ndb.agetypes(agetypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chronologies ADD CONSTRAINT fk_chronologies_collectionunits FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chronologies;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chronologies;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.chronologies FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.chronologies FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n