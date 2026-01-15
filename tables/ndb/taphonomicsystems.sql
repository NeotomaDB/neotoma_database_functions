-- taphonomicsystems definition

-- Drop table

-- DROP TABLE IF EXISTS taphonomicsystems.taphonomicsystems

CREATE TABLE taphonomicsystems.taphonomicsystems (
    taphonomicsystemid integer DEFAULT nextval('ndb.seq_taphonomicsystems_taphonomicsystemid'::regclass) NOT NULL,
    taphonomicsystem character varying(64) NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT taphonomicsystems_pkey PRIMARY KEY (taphonomicsystemid)
);


-- adempiere.wmv_ghgaudit foreign keys

;