-- ndb.lithostrat Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.lithostrat

CREATE TABLE IF NOT EXISTS ndb.lithostrat (

    lithostratid integer DEFAULT nextval('ndb.seq_lithostrat_lithostratid'::regclass) NOT NULL,
    lithostratunitid integer NOT NULL,
    lithostratname character varying(64) NOT NULL,
    higherlithostratid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.lithostrat IS "";

--- Table indices
CREATE UNIQUE INDEX lithostrat_pkey ON ndb.lithostrat USING btree (lithostratid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.lithostrat DROP CONSTRAINT IF EXISTS lithostrat_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.lithostrat ADD CONSTRAINT lithostrat_pkey PRIMARY KEY (lithostratid);

--- Foreign Key Restraints
ALTER TABLE ndb.lithostrat ADD CONSTRAINT fk_lithostratunits_lithostrattypes FOREIGN KEY (lithostratunitid) REFERENCES ndb.lithostratunits(lithostratunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.lithostrat ADD CONSTRAINT fk_higherlithostratid FOREIGN KEY (higherlithostratid) REFERENCES ndb.lithostrat(lithostratid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.lithostrat;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.lithostrat;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.lithostrat FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.lithostrat FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();