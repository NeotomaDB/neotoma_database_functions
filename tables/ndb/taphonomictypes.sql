-- taphonomictypes definition

-- Drop table

-- DROP TABLE IF EXISTS taphonomictypes.taphonomictypes

CREATE TABLE taphonomictypes.taphonomictypes (
    taphonomictypeid integer DEFAULT nextval('ndb.seq_taphonomictypes_taphonomictypeid'::regclass) NOT NULL,
    taphonomicsystemid integer NULL,
    taphonomictype character varying(64) NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT taphonomictypes_pkey PRIMARY KEY (taphonomictypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.taphonomictypes ADD CONSTRAINT fk_taphonomictypes_taphonomicsystems FOREIGN KEY (taphonomicsystemid) REFERENCES ndb.taphonomicsystems(taphonomicsystemid) ON UPDATE CASCADE ON DELETE CASCADE;