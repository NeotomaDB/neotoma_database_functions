-- lithostratunits definition

-- Drop table

-- DROP TABLE IF EXISTS lithostratunits.lithostratunits

CREATE TABLE lithostratunits.lithostratunits (
    lithostratunitid integer DEFAULT nextval('ndb.seq_lithostratunits_lithostratunitid'::regclass) NOT NULL,
    lithostratunit character varying(24) NOT NULL,
    rank integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT lithostratunits_pkey PRIMARY KEY (lithostratunitid)
);


-- adempiere.wmv_ghgaudit foreign keys

;