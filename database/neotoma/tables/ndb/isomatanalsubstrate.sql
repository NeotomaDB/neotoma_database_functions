-- ndb.isomatanalsubstrate Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isomatanalsubstrate

CREATE TABLE IF NOT EXISTS ndb.isomatanalsubstrate (

    isomatanaltypeid integer NOT NULL,
    isosubstratetypeid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.isomatanalsubstrate IS '';
COMMENT ON COLUMN ndb.isomatanalsubstrate.isomatanaltypeid IS '';
COMMENT ON COLUMN ndb.isomatanalsubstrate.isosubstratetypeid IS '';
COMMENT ON COLUMN ndb.isomatanalsubstrate.recdatecreated IS '';
COMMENT ON COLUMN ndb.isomatanalsubstrate.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX isomatanalsubstrate_pkey ON ndb.isomatanalsubstrate USING btree (isomatanaltypeid, isosubstratetypeid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.isomatanalsubstrate DROP CONSTRAINT IF EXISTS isomatanalsubstrate_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isomatanalsubstrate ADD CONSTRAINT isomatanalsubstrate_pkey PRIMARY KEY (isomatanaltypeid, isosubstratetypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.isomatanalsubstrate ADD CONSTRAINT fk_isomatanalsubstrate_isomaterialanalyzedtypes FOREIGN KEY (isomatanaltypeid) REFERENCES ndb.isomaterialanalyzedtypes(isomatanaltypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isomatanalsubstrate ADD CONSTRAINT fk_isomatanalsubstrate_isosubstratetypes FOREIGN KEY (isosubstratetypeid) REFERENCES ndb.isosubstratetypes(isosubstratetypeid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isomatanalsubstrate;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isomatanalsubstrate;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.isomatanalsubstrate FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.isomatanalsubstrate FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n