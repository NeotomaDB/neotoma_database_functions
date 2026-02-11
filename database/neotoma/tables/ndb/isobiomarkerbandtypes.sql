-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isobiomarkerbandtypes

CREATE TABLE IF NOT EXISTS ndb.isobiomarkerbandtypes (

    isobiomarkerbandtypeid integer DEFAULT nextval('ndb.seq_isobiomarkerbandtypes_isobiomarkerbandtypeid'::regclass) NOT NULL,
    isobiomarkertypeid integer NOT NULL,
    isobiomarkerbandtype character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.isobiomarkerbandtypes IS "";

--- Table indices
CREATE UNIQUE INDEX isobiomarkerbandtypes_pkey ON ndb.isobiomarkerbandtypes USING btree (isobiomarkerbandtypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.isobiomarkerbandtypes DROP CONSTRAINT IF EXISTS isobiomarkerbandtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isobiomarkerbandtypes ADD CONSTRAINT isobiomarkerbandtypes_pkey PRIMARY KEY (isobiomarkerbandtypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.isobiomarkerbandtypes ADD CONSTRAINT fk_isobiomarkerbands_isobiomarkertypes FOREIGN KEY (isobiomarkertypeid) REFERENCES ndb.isobiomarkertypes(isobiomarkertypeid) ON UPDATE CASCADE ON DELETE CASCADE;