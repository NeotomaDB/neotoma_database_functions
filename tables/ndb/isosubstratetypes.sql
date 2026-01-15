-- isosubstratetypes definition

-- Drop table

-- DROP TABLE IF EXISTS isosubstratetypes.isosubstratetypes

CREATE TABLE isosubstratetypes.isosubstratetypes (
    isosubstratetypeid integer DEFAULT nextval('ndb.seq_isosubstratetypes_isosubstratetypeid'::regclass) NOT NULL,
    isosubstratetype character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isosubstratetypes_pkey PRIMARY KEY (isosubstratetypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;