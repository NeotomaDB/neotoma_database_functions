-- lakeparametertypes definition

-- Drop table

-- DROP TABLE IF EXISTS lakeparametertypes.lakeparametertypes

CREATE TABLE lakeparametertypes.lakeparametertypes (
    lakeparameterid integer DEFAULT nextval('ndb.seq_lakeparametertypes_lakeparameterid'::regclass) NOT NULL,
    lakeparametercode character varying(20) NOT NULL,
    lakeparametershortname character varying(40) NOT NULL,
    lakeparameter character varying(80) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT lakeparametertypes_pkey PRIMARY KEY (lakeparameterid)
);


-- adempiere.wmv_ghgaudit foreign keys

;