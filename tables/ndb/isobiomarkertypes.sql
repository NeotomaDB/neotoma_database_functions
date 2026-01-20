-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isobiomarkertypes

CREATE TABLE IF NOT EXISTS ndb.isobiomarkertypes (

    isobiomarkertypeid integer DEFAULT nextval('ndb.seq_isobiomarkertypes_isobiomarkertypeid'::regclass) NOT NULL,
    isobiomarkertype character varying(50) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.isobiomarkertypes IS "";

--- Table indices
CREATE UNIQUE INDEX isobiomarkertypes_pkey ON ndb.isobiomarkertypes USING btree (isobiomarkertypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.isobiomarkertypes DROP CONSTRAINT IF EXISTS isobiomarkertypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isobiomarkertypes ADD CONSTRAINT isobiomarkertypes_pkey PRIMARY KEY (isobiomarkertypeid);

--- Foreign Key Restraints