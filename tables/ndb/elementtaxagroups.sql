-- elementtaxagroups definition

-- Drop table

-- DROP TABLE IF EXISTS elementtaxagroups.elementtaxagroups

CREATE TABLE elementtaxagroups.elementtaxagroups (
    elementtaxagroupid integer DEFAULT nextval('ndb.seq_elementtaxagroups_elementtaxagroupid'::regclass) NOT NULL,
    taxagroupid character varying(3) NOT NULL,
    elementtypeid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT elementtaxagroups_pkey PRIMARY KEY (elementtaxagroupid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.elementtaxagroups ADD CONSTRAINT fk_elementtaxagrouptypes_elementtypes FOREIGN KEY (elementtypeid) REFERENCES ndb.elementtypes(elementtypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.elementtaxagroups ADD CONSTRAINT fk_elementtaxagrouptypes_taxagrouptypes FOREIGN KEY (taxagroupid) REFERENCES ndb.taxagrouptypes(taxagroupid) ON UPDATE CASCADE ON DELETE CASCADE;