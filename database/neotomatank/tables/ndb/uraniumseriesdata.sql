-- ndb.uraniumseriesdata Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.uraniumseriesdata

CREATE TABLE IF NOT EXISTS ndb.uraniumseriesdata (

    geochronid integer NULL,
    dataid integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.uraniumseriesdata IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints
ALTER TABLE ndb.uraniumseriesdata ADD CONSTRAINT uraniumseriesdata_geochronid_fkey FOREIGN KEY (geochronid) REFERENCES ndb.geochronology(geochronid);
ALTER TABLE ndb.uraniumseriesdata ADD CONSTRAINT uraniumseriesdata_dataid_fkey FOREIGN KEY (dataid) REFERENCES ndb.data(dataid);

--- Triggers