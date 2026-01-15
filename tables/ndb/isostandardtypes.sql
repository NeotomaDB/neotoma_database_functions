-- isostandardtypes definition

-- Drop table

-- DROP TABLE IF EXISTS isostandardtypes.isostandardtypes

CREATE TABLE isostandardtypes.isostandardtypes (
    isostandardtypeid integer DEFAULT nextval('ndb.seq_isostandardtypes_isostandardtypeid'::regclass) NOT NULL,
    isostandardtype character varying(128) NOT NULL,
    isostandardmaterial character varying(128) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isostandardtypes_pkey PRIMARY KEY (isostandardtypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;