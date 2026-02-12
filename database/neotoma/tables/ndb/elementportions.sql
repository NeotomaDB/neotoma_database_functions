-- ndb.elementportions Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.elementportions

CREATE TABLE IF NOT EXISTS ndb.elementportions (

    portionid integer DEFAULT nextval('ndb.seq_elementportions_portionid'::regclass) NOT NULL,
    portion character varying(48) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.elementportions IS '';
COMMENT ON COLUMN ndb.elementportions.portionid IS '';
COMMENT ON COLUMN ndb.elementportions.portion IS '';
COMMENT ON COLUMN ndb.elementportions.recdatecreated IS '';
COMMENT ON COLUMN ndb.elementportions.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX elementportions_pkey ON ndb.elementportions USING btree (portionid);
CREATE UNIQUE INDEX ix_elementportions ON ndb.elementportions USING btree (portion) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.elementportions DROP CONSTRAINT IF EXISTS elementportions_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.elementportions ADD CONSTRAINT elementportions_pkey PRIMARY KEY (portionid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.elementportions;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.elementportions;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.elementportions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.elementportions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n