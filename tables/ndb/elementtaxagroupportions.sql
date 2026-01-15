-- elementtaxagroupportions definition

-- Drop table

-- DROP TABLE IF EXISTS elementtaxagroupportions.elementtaxagroupportions

CREATE TABLE elementtaxagroupportions.elementtaxagroupportions (
    elementtaxagroupid integer NOT NULL,
    portionid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT elementtaxagroupportions_pkey PRIMARY KEY (elementtaxagroupid, portionid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.elementtaxagroupportions ADD CONSTRAINT fk_elementtaxagroupportions_elementtaxagroups FOREIGN KEY (elementtaxagroupid) REFERENCES ndb.elementtaxagroups(elementtaxagroupid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.elementtaxagroupportions ADD CONSTRAINT fk_elementtaxagroupportions_elementportions FOREIGN KEY (portionid) REFERENCES ndb.elementportions(portionid) ON UPDATE CASCADE ON DELETE CASCADE;