-- ndb.aggregatechronologies Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.aggregatechronologies

CREATE TABLE IF NOT EXISTS ndb.aggregatechronologies (

    aggregatechronid integer DEFAULT nextval('ndb.seq_aggregatechronologies_aggregatechronid'::regclass) NOT NULL,
    aggregatedatasetid integer NOT NULL,
    agetypeid integer NOT NULL,
    isdefault boolean NOT NULL,
    chronologyname character varying(80) NULL,
    ageboundyounger integer NULL,
    ageboundolder integer NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.aggregatechronologies IS 'This table stores metadata for Aggregate Chronologies. An Aggregate Chronology refers to an explicit chronology assigned to a sample Aggregate. The individual Aggregate Samples have ages assigned in the AggregateSampleAges table. An Aggregate Chronology would be used, for example, for a set of packrat middens assigned to an AggregateDataset. The Aggregate Chronology is analogous to the Chronology assigned to samples from a single Collection Unit.
An Aggregate may have more than one Aggregate Chronology, for example one in radiocarbon years and another in calibrated radiocarbon years. One Aggregate Chronology per Age Type may be designated the default, which is the Aggregate Chronology currently preferred by the database stewards.';
COMMENT ON COLUMN ndb.aggregatechronologies.aggregatechronid IS 'PK: An arbitrary Aggregate Chronology identification number';
COMMENT ON COLUMN ndb.aggregatechronologies.aggregatedatasetid IS 'Dataset to which the Aggregate Chronology applies. Field links to the AggregateDatasets table.';
COMMENT ON COLUMN ndb.aggregatechronologies.agetypeid IS 'Age type or units. Field links to the AgeTypes table.';
COMMENT ON COLUMN ndb.aggregatechronologies.isdefault IS 'Indicates whether the Aggregate Chronology is a default or not. Default status is determined by a Neotoma data steward. Aggregate Datasets may have more than one default Aggregate Chronology, but may have only one default Aggregate Chronology per Age Type.';
COMMENT ON COLUMN ndb.aggregatechronologies.chronologyname IS 'Optional name for the Chronology.';
COMMENT ON COLUMN ndb.aggregatechronologies.ageboundyounger IS 'The younger reliable age bound for the Aggregate Chronology. Younger ages may be assigned to samples, but are not regarded as reliable. If the entire Chronology is considered reliable, AgeBoundYounger is assigned the youngest sample age rounded down to the nearest 10. Thus, for 72 BP, AgeBoundYounger = 70 BP; for -45 BP, AgeBoundYounger = -50 BP.';
COMMENT ON COLUMN ndb.aggregatechronologies.ageboundolder IS 'The older reliable age bound for the Aggregate Chronology. Ages older than AgeOlderBound may be assigned to samples, but are not regarded as reliable. This situation is particularly true for ages extrapolated beyond the oldest Chron Control. If the entire Chronology is considered reliable, AgeBoundOlder is assigned the oldest sample age rounded up to the nearest 10. Thus, for 12564 BP, AgeBoundOlder is 12570.';
COMMENT ON COLUMN ndb.aggregatechronologies.notes IS 'Free form notes or comments about the Aggregate Chronology.';
COMMENT ON COLUMN ndb.aggregatechronologies.recdatecreated IS '';
COMMENT ON COLUMN ndb.aggregatechronologies.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX aggregatechronologies_pkey ON ndb.aggregatechronologies USING btree (aggregatechronid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.aggregatechronologies DROP CONSTRAINT IF EXISTS aggregatechronologies_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.aggregatechronologies ADD CONSTRAINT aggregatechronologies_pkey PRIMARY KEY (aggregatechronid);

--- Foreign Key Restraints
ALTER TABLE ndb.aggregatechronologies ADD CONSTRAINT fk_aggregatechronologies_aggregatedatasets FOREIGN KEY (aggregatedatasetid) REFERENCES ndb.aggregatedatasets(aggregatedatasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.aggregatechronologies ADD CONSTRAINT fk_aggregatechronologies_agetypes FOREIGN KEY (agetypeid) REFERENCES ndb.agetypes(agetypeid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.aggregatechronologies;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.aggregatechronologies;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.aggregatechronologies FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.aggregatechronologies FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n