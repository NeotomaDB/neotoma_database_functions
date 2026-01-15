-- elementportions definition

-- Drop table

-- DROP TABLE IF EXISTS elementportions.elementportions

CREATE TABLE elementportions.elementportions (
    portionid integer DEFAULT nextval('ndb.seq_elementportions_portionid'::regclass) NOT NULL,
    portion character varying(48) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT elementportions_pkey PRIMARY KEY (portionid)
);


-- adempiere.wmv_ghgaudit foreign keys

;