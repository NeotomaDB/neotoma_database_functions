-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.sampleages

CREATE TABLE IF NOT EXISTS ndb.sampleages (

    sampleageid integer DEFAULT nextval('ndb.seq_sampleages_sampleageid'::regclass) NOT NULL,
    sampleid integer NOT NULL,
    chronologyid integer NOT NULL,
    age double precision NULL,
    ageyounger double precision NULL,
    ageolder double precision NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.sampleages IS "This table stores sample ages. Ages are assigned to a Chronology. Because there may be more than one Chronology for a Collection Unit, samples may be assigned different ages for different Chronologies. A simple example is one sample age in radiocarbon years and another in calibrated radiocarbon years. The age units are an attribute of the Chronology.";

--- Table indices
CREATE UNIQUE INDEX sampleages_pkey ON ndb.sampleages USING btree (sampleageid);
CREATE INDEX ix_chronologyid_sampleages ON ndb.sampleages USING btree (chronologyid) WITH (fillfactor='10');
CREATE INDEX ix_sampleid_sampleages ON ndb.sampleages USING btree (sampleid) WITH (fillfactor='10');
CREATE INDEX smpage_idx ON ndb.sampleages USING btree (age);
CREATE INDEX smpageold_idx ON ndb.sampleages USING btree (ageolder);
CREATE INDEX smpageyoung_idx ON ndb.sampleages USING btree (ageyounger)

--- Remove existing constraints if needed
ALTER TABLE ndb.sampleages DROP CONSTRAINT IF EXISTS sampleages_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.sampleages ADD CONSTRAINT sampleages_pkey PRIMARY KEY (sampleageid);

--- Foreign Key Restraints
ALTER TABLE ndb.sampleages ADD CONSTRAINT fk_sampleages_chronologies FOREIGN KEY (chronologyid) REFERENCES ndb.chronologies(chronologyid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.sampleages ADD CONSTRAINT fk_sampleages_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;