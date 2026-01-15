-- externaltaxa definition

-- Drop table

-- DROP TABLE IF EXISTS externaltaxa.externaltaxa

CREATE TABLE externaltaxa.externaltaxa (
    taxonid integer NOT NULL,
    extdatabaseid integer NOT NULL,
    exttaxonid character varying(64) NOT NULL,
    url character varying(128) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT externaltaxa_pkey PRIMARY KEY (taxonid, extdatabaseid, exttaxonid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.externaltaxa ADD CONSTRAINT fk_externaltaxa_externaldatabases FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.externaltaxa ADD CONSTRAINT fk_externaltaxa_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;