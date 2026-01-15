-- elementdatasettaxagroups definition

-- Drop table

-- DROP TABLE IF EXISTS elementdatasettaxagroups.elementdatasettaxagroups

CREATE TABLE elementdatasettaxagroups.elementdatasettaxagroups (
    datasettypeid integer NOT NULL,
    taxagroupid character varying(3) NOT NULL,
    elementtypeid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT elementdatasettaxagroups_pkey PRIMARY KEY (datasettypeid, taxagroupid, elementtypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.elementdatasettaxagroups ADD CONSTRAINT fk_datasettypeid FOREIGN KEY (datasettypeid) REFERENCES ndb.datasettypes(datasettypeid);
ALTER TABLE ndb.elementdatasettaxagroups ADD CONSTRAINT edt_group FOREIGN KEY (taxagroupid) REFERENCES ndb.taxagrouptypes(taxagroupid);