-- datasettaxagrouptypes definition

-- Drop table

-- DROP TABLE IF EXISTS datasettaxagrouptypes.datasettaxagrouptypes

CREATE TABLE datasettaxagrouptypes.datasettaxagrouptypes (
    datasettypeid integer NOT NULL,
    taxagroupid character varying(3) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT datasettaxagrouptypes_pkey PRIMARY KEY (datasettypeid, taxagroupid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.datasettaxagrouptypes ADD CONSTRAINT fk_datasettaxagrouptypes_taxagrouptypes FOREIGN KEY (taxagroupid) REFERENCES ndb.taxagrouptypes(taxagroupid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasettaxagrouptypes ADD CONSTRAINT fk_datasettaxagrouptypes_datasettypes FOREIGN KEY (datasettypeid) REFERENCES ndb.datasettypes(datasettypeid) ON UPDATE CASCADE ON DELETE CASCADE;