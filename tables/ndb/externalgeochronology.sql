-- externalgeochronology definition

-- Drop table

-- DROP TABLE IF EXISTS externalgeochronology.externalgeochronology

CREATE TABLE externalgeochronology.externalgeochronology (
    geochronid integer NULL,
    extdatabaseid integer NULL,
    identifier text NULL,
    CONSTRAINT uniqueid UNIQUE (geochronid, extdatabaseid, identifier)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.externalgeochronology ADD CONSTRAINT externalgeochronology_geochronid_fkey FOREIGN KEY (geochronid) REFERENCES ndb.geochronology(geochronid);
ALTER TABLE ndb.externalgeochronology ADD CONSTRAINT externalgeochronology_extdatabaseid_fkey FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid);