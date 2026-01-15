-- elementtaxagroupmaturities definition

-- Drop table

-- DROP TABLE IF EXISTS elementtaxagroupmaturities.elementtaxagroupmaturities

CREATE TABLE elementtaxagroupmaturities.elementtaxagroupmaturities (
    elementtaxagroupid integer NOT NULL,
    maturityid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT elementtaxagroupmaturities_pkey PRIMARY KEY (elementtaxagroupid, maturityid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.elementtaxagroupmaturities ADD CONSTRAINT fk_elementtaxagroupmaturities_elementmaturities FOREIGN KEY (maturityid) REFERENCES ndb.elementmaturities(maturityid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.elementtaxagroupmaturities ADD CONSTRAINT fk_elementtaxagroupmaturities_elementtaxagroup FOREIGN KEY (elementtaxagroupid) REFERENCES ndb.elementtaxagroups(elementtaxagroupid) ON UPDATE CASCADE ON DELETE CASCADE;