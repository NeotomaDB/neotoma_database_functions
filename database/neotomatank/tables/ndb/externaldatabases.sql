-- ndb.externaldatabases Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.externaldatabases

CREATE TABLE IF NOT EXISTS ndb.externaldatabases (

    extdatabaseid integer DEFAULT nextval('ndb.seq_externaldatabases_extdatabaseid'::regclass) NOT NULL,
    extdatabasename character varying(80) NOT NULL,
    url character varying(128) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    urlmask character varying(128) NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.externaldatabases IS "";

--- Table indices
CREATE UNIQUE INDEX externaldatabases_pkey ON ndb.externaldatabases USING btree (extdatabaseid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.externaldatabases DROP CONSTRAINT IF EXISTS externaldatabases_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.externaldatabases ADD CONSTRAINT externaldatabases_pkey PRIMARY KEY (extdatabaseid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.externaldatabases;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.externaldatabases;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.externaldatabases FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.externaldatabases FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();