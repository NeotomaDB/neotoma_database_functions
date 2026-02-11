-- ndb.eventtypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.eventtypes

CREATE TABLE IF NOT EXISTS ndb.eventtypes (

    eventtypeid integer DEFAULT nextval('ndb.seq_eventtypes_eventtypeid'::regclass) NOT NULL,
    eventtype character varying(40) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    chroncontroltypeid integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.eventtypes IS "";

--- Table indices
CREATE UNIQUE INDEX eventtypes_pkey ON ndb.eventtypes USING btree (eventtypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.eventtypes DROP CONSTRAINT IF EXISTS eventtypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.eventtypes ADD CONSTRAINT eventtypes_pkey PRIMARY KEY (eventtypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.eventtypes ADD CONSTRAINT evt_cct FOREIGN KEY (chroncontroltypeid) REFERENCES ndb.chroncontroltypes(chroncontroltypeid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.eventtypes;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.eventtypes;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.eventtypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.eventtypes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();