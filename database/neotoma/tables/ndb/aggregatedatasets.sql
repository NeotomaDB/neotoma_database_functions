-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.aggregatedatasets

CREATE TABLE IF NOT EXISTS ndb.aggregatedatasets (

    aggregatedatasetid integer DEFAULT nextval('ndb.seq_aggregatedatasets_aggregatedatasetid'::regclass) NOT NULL,
    aggregatedatasetname character varying(255) NOT NULL,
    aggregateordertypeid integer NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.aggregatedatasets IS "Aggregate Datasets are aggregates of samples of a particular data type. Some examples:  
* Plant macrofossil samples from a group of packrat middens collected from a particular valley, mountain range, or other similarly defined geographic area. Each midden is from a different Site or Collection Unit, but they are grouped into time series for that area and are published as a single dataset.
* Samples collected from 32 cutbanks along several km of Roberts Creek, northeast Iowa. Each sample is from a different site, but they form a time series from 0-12,510 14C yr BP, and pollen, plant macrofossils, and beetles were published and graphed as if from a single site.
* A set of pollen surface samples from a particular region or study that were published and analyzed as a single dataset and submitted to the database as a single dataset.
The examples above are datasets predefined in the database. New aggregate datasets could be assembled for particular studies, for example all the pollen samples for a given time slice for a given geographic region.";

--- Table indices
CREATE UNIQUE INDEX aggregatedatasets_pkey ON ndb.aggregatedatasets USING btree (aggregatedatasetid)

--- Remove existing constraints if needed
ALTER TABLE ndb.aggregatedatasets DROP CONSTRAINT IF EXISTS aggregatedatasets_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.aggregatedatasets ADD CONSTRAINT aggregatedatasets_pkey PRIMARY KEY (aggregatedatasetid);

--- Foreign Key Restraints
ALTER TABLE ndb.aggregatedatasets ADD CONSTRAINT fk_aggregatedatasets_aggregateordertypes FOREIGN KEY (aggregateordertypeid) REFERENCES ndb.aggregateordertypes(aggregateordertypeid) ON UPDATE CASCADE ON DELETE CASCADE;