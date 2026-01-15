-- stewarddatabases definition

-- Drop table

-- DROP TABLE IF EXISTS stewarddatabases.stewarddatabases

CREATE TABLE stewarddatabases.stewarddatabases (
    stewardid integer NOT NULL,
    databaseid integer NOT NULL,
    CONSTRAINT stewarddatabases_pkey PRIMARY KEY (stewardid, databaseid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ti.stewarddatabases ADD CONSTRAINT fk_stewarddatabases_constituentdatabases FOREIGN KEY (databaseid) REFERENCES ndb.constituentdatabases(databaseid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ti.stewarddatabases ADD CONSTRAINT fk_stewarddatabases_stewards FOREIGN KEY (stewardid) REFERENCES ti.stewards(stewardid) ON UPDATE CASCADE ON DELETE CASCADE;