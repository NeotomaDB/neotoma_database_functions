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
COMMENT ON TABLE ndb.aggregatechronologies IS "This table stores metadata for Aggregate Chronologies. An Aggregate Chronology refers to an explicit chronology assigned to a sample Aggregate. The individual Aggregate Samples have ages assigned in the AggregateSampleAges table. An Aggregate Chronology would be used, for example, for a set of packrat middens assigned to an AggregateDataset. The Aggregate Chronology is analogous to the Chronology assigned to samples from a single Collection Unit.
An Aggregate may have more than one Aggregate Chronology, for example one in radiocarbon years and another in calibrated radiocarbon years. One Aggregate Chronology per Age Type may be designated the default, which is the Aggregate Chronology currently preferred by the database stewards.";

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
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.aggregatechronologies;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.aggregatechronologies;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.aggregatechronologies FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.aggregatechronologies FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();