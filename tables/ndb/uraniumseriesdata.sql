-- uraniumseriesdata definition

-- Drop table

-- DROP TABLE IF EXISTS uraniumseriesdata.uraniumseriesdata

CREATE TABLE uraniumseriesdata.uraniumseriesdata (
    geochronid integer NULL,
    dataid integer NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.uraniumseriesdata ADD CONSTRAINT uraniumseriesdata_geochronid_fkey FOREIGN KEY (geochronid) REFERENCES ndb.geochronology(geochronid);
ALTER TABLE ndb.uraniumseriesdata ADD CONSTRAINT uraniumseriesdata_dataid_fkey FOREIGN KEY (dataid) REFERENCES ndb.data(dataid);