-- chroncontroltypes definition

-- Drop table

-- DROP TABLE IF EXISTS chroncontroltypes.chroncontroltypes

CREATE TABLE chroncontroltypes.chroncontroltypes (
    chroncontroltypeid integer DEFAULT nextval('ndb.seq_chroncontroltypes_chroncontroltypeid'::regclass) NOT NULL,
    chroncontroltype character varying(64) NULL,
    higherchroncontroltypeid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT chroncontroltypes_pkey PRIMARY KEY (chroncontroltypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.chroncontroltypes ADD CONSTRAINT fk_higherchroncontroltypeid FOREIGN KEY (higherchroncontroltypeid) REFERENCES ndb.chroncontroltypes(chroncontroltypeid);