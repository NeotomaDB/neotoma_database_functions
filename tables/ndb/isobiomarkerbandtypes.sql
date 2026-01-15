-- isobiomarkerbandtypes definition

-- Drop table

-- DROP TABLE IF EXISTS isobiomarkerbandtypes.isobiomarkerbandtypes

CREATE TABLE isobiomarkerbandtypes.isobiomarkerbandtypes (
    isobiomarkerbandtypeid integer DEFAULT nextval('ndb.seq_isobiomarkerbandtypes_isobiomarkerbandtypeid'::regclass) NOT NULL,
    isobiomarkertypeid integer NOT NULL,
    isobiomarkerbandtype character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isobiomarkerbandtypes_pkey PRIMARY KEY (isobiomarkerbandtypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.isobiomarkerbandtypes ADD CONSTRAINT fk_isobiomarkerbands_isobiomarkertypes FOREIGN KEY (isobiomarkertypeid) REFERENCES ndb.isobiomarkertypes(isobiomarkertypeid) ON UPDATE CASCADE ON DELETE CASCADE;