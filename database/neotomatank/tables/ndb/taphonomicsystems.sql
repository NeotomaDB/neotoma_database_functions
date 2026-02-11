-- ndb.taphonomicsystems Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.taphonomicsystems

CREATE TABLE IF NOT EXISTS ndb.taphonomicsystems (

    taphonomicsystemid integer DEFAULT nextval('ndb.seq_taphonomicsystems_taphonomicsystemid'::regclass) NOT NULL,
    taphonomicsystem character varying(64) NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.taphonomicsystems IS "";

--- Table indices
CREATE UNIQUE INDEX taphonomicsystems_pkey ON ndb.taphonomicsystems USING btree (taphonomicsystemid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.taphonomicsystems DROP CONSTRAINT IF EXISTS taphonomicsystems_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.taphonomicsystems ADD CONSTRAINT taphonomicsystems_pkey PRIMARY KEY (taphonomicsystemid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.taphonomicsystems;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.taphonomicsystems;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.taphonomicsystems FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.taphonomicsystems FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();