-- datauncertainties definition

-- Drop table

-- DROP TABLE IF EXISTS datauncertainties.datauncertainties

CREATE TABLE datauncertainties.datauncertainties (
    dataid integer NULL,
    uncertaintyvalue double precision NULL,
    uncertaintyunitid integer NULL,
    uncertaintybasisid integer NULL,
    notes text NULL,
    CONSTRAINT uniqueentryvalue UNIQUE (dataid, uncertaintyunitid, uncertaintybasisid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.datauncertainties ADD CONSTRAINT datauncertainties_uncertaintyunitid_fkey FOREIGN KEY (uncertaintyunitid) REFERENCES ndb.variableunits(variableunitsid);
ALTER TABLE ndb.datauncertainties ADD CONSTRAINT datauncertainties_dataid_fkey FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON DELETE CASCADE;
ALTER TABLE ndb.datauncertainties ADD CONSTRAINT datauncertainties_uncertaintybasisid_fkey FOREIGN KEY (uncertaintybasisid) REFERENCES ndb.uncertaintybases(uncertaintybasisid);