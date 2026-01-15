-- isoscaletypes definition

-- Drop table

-- DROP TABLE IF EXISTS isoscaletypes.isoscaletypes

CREATE TABLE isoscaletypes.isoscaletypes (
    isoscaletypeid integer DEFAULT nextval('ndb.seq_isoscaletypes_isoscaletypeid'::regclass) NOT NULL,
    isoscaleacronym character varying(24) NOT NULL,
    isoscalename character varying(80) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isoscaletypes_pkey PRIMARY KEY (isoscaletypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;