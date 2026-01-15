-- lakeparameters definition

-- Drop table

-- DROP TABLE IF EXISTS lakeparameters.lakeparameters

CREATE TABLE lakeparameters.lakeparameters (
    siteid integer NOT NULL,
    lakeparameterid integer NOT NULL,
    value double precision NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT lakeparameters_pkey PRIMARY KEY (siteid, lakeparameterid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.lakeparameters ADD CONSTRAINT fk_lakeparameters_lakeparametertypes FOREIGN KEY (lakeparameterid) REFERENCES ndb.lakeparametertypes(lakeparameterid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.lakeparameters ADD CONSTRAINT fk_lakeparameters_sites FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON UPDATE CASCADE ON DELETE CASCADE;