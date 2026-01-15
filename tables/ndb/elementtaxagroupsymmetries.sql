-- elementtaxagroupsymmetries definition

-- Drop table

-- DROP TABLE IF EXISTS elementtaxagroupsymmetries.elementtaxagroupsymmetries

CREATE TABLE elementtaxagroupsymmetries.elementtaxagroupsymmetries (
    elementtaxagroupid integer NOT NULL,
    symmetryid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT elementtaxagroupsymmetries_pkey PRIMARY KEY (elementtaxagroupid, symmetryid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.elementtaxagroupsymmetries ADD CONSTRAINT fk_elementtaxagroupsymmetries_elementtaxagroups FOREIGN KEY (elementtaxagroupid) REFERENCES ndb.elementtaxagroups(elementtaxagroupid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.elementtaxagroupsymmetries ADD CONSTRAINT fk_elementtaxagroupsymmetries_elementsymmetries FOREIGN KEY (symmetryid) REFERENCES ndb.elementsymmetries(symmetryid) ON UPDATE CASCADE ON DELETE CASCADE;