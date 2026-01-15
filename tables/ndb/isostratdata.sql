-- isostratdata definition

-- Drop table

-- DROP TABLE IF EXISTS isostratdata.isostratdata

CREATE TABLE isostratdata.isostratdata (
    dataid integer NOT NULL,
    sd double precision NULL,
    taxonid integer NULL,
    elementtypeid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isostratdata_pkey PRIMARY KEY (dataid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.isostratdata ADD CONSTRAINT fk_isostratdata_elementtypes FOREIGN KEY (elementtypeid) REFERENCES ndb.elementtypes(elementtypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isostratdata ADD CONSTRAINT fk_isostratdata_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isostratdata ADD CONSTRAINT fk_isostratdata_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid);