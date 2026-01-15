-- elementsymmetries definition

-- Drop table

-- DROP TABLE IF EXISTS elementsymmetries.elementsymmetries

CREATE TABLE elementsymmetries.elementsymmetries (
    symmetryid integer DEFAULT nextval('ndb.seq_elementsymmetries_symmetryid'::regclass) NOT NULL,
    symmetry character varying(24) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT elementsymmetries_pkey PRIMARY KEY (symmetryid)
);


-- adempiere.wmv_ghgaudit foreign keys

;