-- entitycovertypes definition

-- Drop table

-- DROP TABLE IF EXISTS entitycovertypes.entitycovertypes

CREATE TABLE entitycovertypes.entitycovertypes (
    entitycoverid integer DEFAULT nextval('ndb.entitycovertypes_entitycoverid_seq'::regclass) NOT NULL,
    entitycovertype character varying(50) NULL,
    entitycovernotes text NULL,
    CONSTRAINT entitycovertypes_pkey PRIMARY KEY (entitycoverid)
);


-- adempiere.wmv_ghgaudit foreign keys

;