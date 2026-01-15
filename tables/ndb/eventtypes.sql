-- eventtypes definition

-- Drop table

-- DROP TABLE IF EXISTS eventtypes.eventtypes

CREATE TABLE eventtypes.eventtypes (
    eventtypeid integer DEFAULT nextval('ndb.seq_eventtypes_eventtypeid'::regclass) NOT NULL,
    eventtype character varying(40) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    chroncontroltypeid integer NULL,
    CONSTRAINT eventtypes_pkey PRIMARY KEY (eventtypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.eventtypes ADD CONSTRAINT evt_cct FOREIGN KEY (chroncontroltypeid) REFERENCES ndb.chroncontroltypes(chroncontroltypeid);