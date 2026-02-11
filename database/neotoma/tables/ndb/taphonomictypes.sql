-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.taphonomictypes

CREATE TABLE IF NOT EXISTS ndb.taphonomictypes (

    taphonomictypeid integer DEFAULT nextval('ndb.seq_taphonomictypes_taphonomictypeid'::regclass) NOT NULL,
    taphonomicsystemid integer NULL,
    taphonomictype character varying(64) NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.taphonomictypes IS "";

--- Table indices
CREATE UNIQUE INDEX taphonomictypes_pkey ON ndb.taphonomictypes USING btree (taphonomictypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.taphonomictypes DROP CONSTRAINT IF EXISTS taphonomictypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.taphonomictypes ADD CONSTRAINT taphonomictypes_pkey PRIMARY KEY (taphonomictypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.taphonomictypes ADD CONSTRAINT fk_taphonomictypes_taphonomicsystems FOREIGN KEY (taphonomicsystemid) REFERENCES ndb.taphonomicsystems(taphonomicsystemid) ON UPDATE CASCADE ON DELETE CASCADE;