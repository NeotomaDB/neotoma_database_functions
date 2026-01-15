-- datasettypes definition

-- Drop table

-- DROP TABLE IF EXISTS datasettypes.datasettypes

CREATE TABLE datasettypes.datasettypes (
    datasettypeid integer DEFAULT nextval('ndb.seq_datasettypes_datasettypeid'::regclass) NOT NULL,
    datasettype character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT datasettypes_pkey PRIMARY KEY (datasettypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;