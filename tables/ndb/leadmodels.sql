-- leadmodels definition

-- Drop table

-- DROP TABLE IF EXISTS leadmodels.leadmodels

CREATE TABLE leadmodels.leadmodels (
    pbbasisid integer NULL,
    analysisunitid integer NULL,
    cumulativeinventory numeric NULL,
    CONSTRAINT leadmodels_cumulativeinventory_check CHECK ((cumulativeinventory > (0)::numeric))
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.leadmodels ADD CONSTRAINT leadmodels_pbbasisid_fkey FOREIGN KEY (pbbasisid) REFERENCES ndb.leadmodelbasis(pbbasisid);
ALTER TABLE ndb.leadmodels ADD CONSTRAINT leadmodels_analysisunitid_fkey FOREIGN KEY (analysisunitid) REFERENCES ndb.analysisunits(analysisunitid);