-- elementtypes definition

-- Drop table

-- DROP TABLE IF EXISTS elementtypes.elementtypes

CREATE TABLE elementtypes.elementtypes (
    elementtypeid integer DEFAULT nextval('ndb.seq_elementtypes_elementtypeid'::regclass) NOT NULL,
    elementtype character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT elementtypes_pkey PRIMARY KEY (elementtypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;