-- ndb.isostratdata Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isostratdata

CREATE TABLE IF NOT EXISTS ndb.isostratdata (

    dataid integer NOT NULL,
    sd double precision NULL,
    taxonid integer NULL,
    elementtypeid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.isostratdata IS "";

--- Table indices
CREATE UNIQUE INDEX isostratdata_pkey ON ndb.isostratdata USING btree (dataid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.isostratdata DROP CONSTRAINT IF EXISTS isostratdata_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isostratdata ADD CONSTRAINT isostratdata_pkey PRIMARY KEY (dataid);

--- Foreign Key Restraints
ALTER TABLE ndb.isostratdata ADD CONSTRAINT fk_isostratdata_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid);
ALTER TABLE ndb.isostratdata ADD CONSTRAINT fk_isostratdata_elementtypes FOREIGN KEY (elementtypeid) REFERENCES ndb.elementtypes(elementtypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isostratdata ADD CONSTRAINT fk_isostratdata_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isostratdata;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.isostratdata;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.isostratdata FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.isostratdata FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();