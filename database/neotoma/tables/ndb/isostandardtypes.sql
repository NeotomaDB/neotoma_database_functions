-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isostandardtypes

CREATE TABLE IF NOT EXISTS ndb.isostandardtypes (

    isostandardtypeid integer DEFAULT nextval('ndb.seq_isostandardtypes_isostandardtypeid'::regclass) NOT NULL,
    isostandardtype character varying(128) NOT NULL,
    isostandardmaterial character varying(128) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.isostandardtypes IS "";

--- Table indices
CREATE UNIQUE INDEX isostandardtypes_pkey ON ndb.isostandardtypes USING btree (isostandardtypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.isostandardtypes DROP CONSTRAINT IF EXISTS isostandardtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isostandardtypes ADD CONSTRAINT isostandardtypes_pkey PRIMARY KEY (isostandardtypeid);

--- Foreign Key Restraints