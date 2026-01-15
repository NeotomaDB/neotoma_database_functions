-- ecolgroups definition

-- Drop table

-- DROP TABLE IF EXISTS ecolgroups.ecolgroups

CREATE TABLE ecolgroups.ecolgroups (
    taxonid integer NOT NULL,
    ecolsetid integer NOT NULL,
    ecolgroupid character varying(4) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT ecolgroups_pkey PRIMARY KEY (taxonid, ecolsetid),
    CONSTRAINT ecolgroups_unique UNIQUE (taxonid, ecolsetid, ecolgroupid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.ecolgroups ADD CONSTRAINT fk_ecolgroups_ecolgrouptypes FOREIGN KEY (ecolgroupid) REFERENCES ndb.ecolgrouptypes(ecolgroupid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.ecolgroups ADD CONSTRAINT fk_ecolgroups_ecolsettypes FOREIGN KEY (ecolsetid) REFERENCES ndb.ecolsettypes(ecolsetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.ecolgroups ADD CONSTRAINT fk_ecolgroups_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;