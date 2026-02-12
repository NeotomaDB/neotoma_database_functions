-- ndb.specimens Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.specimens

CREATE TABLE IF NOT EXISTS ndb.specimens (

    specimenid integer DEFAULT nextval('ndb.seq_specimens_specimenid'::regclass) NOT NULL,
    dataid integer NOT NULL,
    elementtypeid integer NULL,
    symmetryid integer NULL,
    portionid integer NULL,
    maturityid integer NULL,
    sexid integer NULL,
    domesticstatusid integer NULL,
    preservative character varying(256) NULL,
    nisp double precision NULL,
    repositoryid integer NULL,
    specimennr character varying(50) NULL,
    fieldnr character varying(50) NULL,
    arctosnr character varying(50) NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.specimens IS '';
COMMENT ON COLUMN ndb.specimens.specimenid IS '';
COMMENT ON COLUMN ndb.specimens.dataid IS '';
COMMENT ON COLUMN ndb.specimens.elementtypeid IS '';
COMMENT ON COLUMN ndb.specimens.symmetryid IS '';
COMMENT ON COLUMN ndb.specimens.portionid IS '';
COMMENT ON COLUMN ndb.specimens.maturityid IS '';
COMMENT ON COLUMN ndb.specimens.sexid IS '';
COMMENT ON COLUMN ndb.specimens.domesticstatusid IS '';
COMMENT ON COLUMN ndb.specimens.preservative IS '';
COMMENT ON COLUMN ndb.specimens.nisp IS '';
COMMENT ON COLUMN ndb.specimens.repositoryid IS '';
COMMENT ON COLUMN ndb.specimens.specimennr IS '';
COMMENT ON COLUMN ndb.specimens.fieldnr IS '';
COMMENT ON COLUMN ndb.specimens.arctosnr IS '';
COMMENT ON COLUMN ndb.specimens.notes IS '';
COMMENT ON COLUMN ndb.specimens.recdatecreated IS '';
COMMENT ON COLUMN ndb.specimens.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX specimens_pkey ON ndb.specimens USING btree (specimenid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.specimens DROP CONSTRAINT IF EXISTS specimens_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.specimens ADD CONSTRAINT specimens_pkey PRIMARY KEY (specimenid);

--- Foreign Key Restraints
ALTER TABLE ndb.specimens ADD CONSTRAINT fk_specimens_elementsymmetries FOREIGN KEY (symmetryid) REFERENCES ndb.elementsymmetries(symmetryid);
ALTER TABLE ndb.specimens ADD CONSTRAINT fk_specimens_elementtypes FOREIGN KEY (elementtypeid) REFERENCES ndb.elementtypes(elementtypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.specimens ADD CONSTRAINT fk_specimens_repositoryinstitutions FOREIGN KEY (repositoryid) REFERENCES ndb.repositoryinstitutions(repositoryid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.specimens ADD CONSTRAINT fk_specimens_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.specimens ADD CONSTRAINT fk_specimens_elementmaturities FOREIGN KEY (maturityid) REFERENCES ndb.elementmaturities(maturityid);
ALTER TABLE ndb.specimens ADD CONSTRAINT fk_specimens_specimensex FOREIGN KEY (sexid) REFERENCES ndb.specimensextypes(sexid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.specimens ADD CONSTRAINT fk_specimens_specimendomesticstatus FOREIGN KEY (domesticstatusid) REFERENCES ndb.specimendomesticstatustypes(domesticstatusid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.specimens ADD CONSTRAINT fk_specimens_elementportions FOREIGN KEY (portionid) REFERENCES ndb.elementportions(portionid);

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.specimens;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.specimens;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.specimens FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.specimens FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n