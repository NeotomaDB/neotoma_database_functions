-- uraniumseries definition

-- Drop table

-- DROP TABLE IF EXISTS uraniumseries.uraniumseries

CREATE TABLE uraniumseries.uraniumseries (
    geochronid integer NULL,
    decayconstantid integer NULL,
    ratio230th232th numeric NULL,
    ratiouncertainty230th232th numeric NULL,
    activity230th238u numeric NULL,
    activityuncertainty230th238u numeric NULL,
    activity234u238u numeric NULL,
    activityuncertainty234u238u numeric NULL,
    iniratio230th232th numeric NULL,
    iniratiouncertainty230th232th numeric NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.uraniumseries ADD CONSTRAINT uraniumseries_geochronid_fkey FOREIGN KEY (geochronid) REFERENCES ndb.geochronology(geochronid);
ALTER TABLE ndb.uraniumseries ADD CONSTRAINT uraniumseries_decayconstantid_fkey FOREIGN KEY (decayconstantid) REFERENCES ndb.decayconstants(decayconstantid);