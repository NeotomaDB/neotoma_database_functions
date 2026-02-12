-- ndb.lithology Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.lithology

CREATE TABLE IF NOT EXISTS ndb.lithology (

    lithologyid integer DEFAULT nextval('ndb.seq_lithology_lithologyid'::regclass) NOT NULL,
    collectionunitid integer NOT NULL,
    depthtop double precision NULL,
    depthbottom double precision NULL,
    lowerboundary character varying(255) NULL,
    description text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.lithology IS 'This table stores the lithologic descriptions of Collection Units.';
COMMENT ON COLUMN ndb.lithology.lithologyid IS 'An arbitrary identification number for a lithologic unit.';
COMMENT ON COLUMN ndb.lithology.collectionunitid IS 'Collection Unit identification number. Field links to the CollectionUnits table.';
COMMENT ON COLUMN ndb.lithology.depthtop IS 'Depth of the top of the lithologic unit in cm.';
COMMENT ON COLUMN ndb.lithology.depthbottom IS 'Depth of the bottom of the lithologic unit in cm.';
COMMENT ON COLUMN ndb.lithology.lowerboundary IS '';
COMMENT ON COLUMN ndb.lithology.description IS 'Description of the lithologic unit. These can be quite detailed, with Munsell color or Troels-Smith descriptions. Some examples:
interbedded gray silt and peat
marly fine-detritus copropel
humified sedge and Sphagnum peat
sedge peat 5YR 5/4
gray sandy loam with mammoth and other animal bones
grey-green gyttja, oxidizing to gray-brown
Ag 3, Ga 1, medium gray, firm, elastic
nig3, strf0, elas2, sicc0; Th2 T12 Tb+
Ld°4, Ga+, Dg+, Dh+';
COMMENT ON COLUMN ndb.lithology.recdatecreated IS '';
COMMENT ON COLUMN ndb.lithology.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX lithology_pkey ON ndb.lithology USING btree (lithologyid);
CREATE INDEX ix_collectionunitid_lithology ON ndb.lithology USING btree (collectionunitid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.lithology DROP CONSTRAINT IF EXISTS lithology_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.lithology ADD CONSTRAINT lithology_pkey PRIMARY KEY (lithologyid);

--- Foreign Key Restraints
ALTER TABLE ndb.lithology ADD CONSTRAINT fk_lithology_collectionunits FOREIGN KEY (collectionunitid) REFERENCES ndb.collectionunits(collectionunitid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.lithology;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.lithology;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.lithology FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.lithology FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n