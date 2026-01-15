-- isosamplepretreatments definition

-- Drop table

-- DROP TABLE IF EXISTS isosamplepretreatments.isosamplepretreatments

CREATE TABLE isosamplepretreatments.isosamplepretreatments (
    dataid integer NOT NULL,
    isopretreatmenttypeid integer NOT NULL,
    "order" integer NOT NULL,
    value double precision NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isosamplepretreatments_pkey PRIMARY KEY (dataid, isopretreatmenttypeid, "order")
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.isosamplepretreatments ADD CONSTRAINT fk_isosamplepretreatments_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isosamplepretreatments ADD CONSTRAINT fk_isosamplepretreatments_isopretratmenttypes FOREIGN KEY (isopretreatmenttypeid) REFERENCES ndb.isopretreatmenttypes(isopretreatmenttypeid) ON UPDATE CASCADE ON DELETE CASCADE;