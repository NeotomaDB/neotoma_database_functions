-- ndb definition

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


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.chronologies IS "This table stores Chronology data. A Chronology refers to an explicit chronology assigned to a Collection Unit. A Chronology has Chronology Controls, the actual age-depth control points, which are stored in the ChronControls table. A Chronology is also based on an Age Model, which may be a numerical method that fits a curve to a set of age-depth control points or may simply be individually dated Analysis Units.
A Collection Unit may have more than one Chronology, for example one in radiocarbon years and another in calibrated radiocarbon years. There may be a Chronology developed by the original author and another developed by a later research project. Chronologies may be stored for archival reasons, even though they are now believed to have problems, if they were used for an important research project. One Chronology per Age Type may be designated the default Chronology, which is the Chronology currently preferred by the database stewards.
Based upon the Chronology, which includes the Age Model and the Chron Controls, ages are assigned to individual samples, which are stored in the SampleAges table.
A younger and older age bounds are assigned to the Chronology. Within these bounds the Chronology is regarded as reliable. Ages may be assigned to samples beyond the reliable age bounds, but these are not considered reliable";

--- Table indices
CREATE UNIQUE INDEX chronologies_pkey ON ndb.chronologies USING btree (chronologyid);
CREATE INDEX chroldage_idx ON ndb.chronologies USING btree (ageboundolder);
CREATE INDEX chryoungage_idx ON ndb.chronologies USING btree (ageboundyounger);
CREATE INDEX oldage_idx ON ndb.chronologies USING btree (ageboundolder);
CREATE INDEX youngage_idx ON ndb.chronologies USING btree (ageboundyounger);
CREATE INDEX idx_chronologies_default ON ndb.chronologies USING btree (chronologyid) WHERE (isdefault = true)

--- Remove existing constraints if needed
ALTER TABLE ndb.chronologies DROP CONSTRAINT IF EXISTS chronologies_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.chronologies ADD CONSTRAINT chronologies_pkey PRIMARY KEY (chronologyid);

--- Foreign Key Restraints
ALTER TABLE ndb.chronologies ADD CONSTRAINT fk_chronologies_collectionunits FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chronologies ADD CONSTRAINT fk_chronologies_agetypes FOREIGN KEY (agetypeid) REFERENCES ndb.agetypes(agetypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chronologies ADD CONSTRAINT fk_chronologies_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;