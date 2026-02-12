-- ndb.relativeages Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.relativeages

CREATE TABLE IF NOT EXISTS ndb.relativeages (

    relativeageid integer DEFAULT nextval('ndb.seq_relativeages_relativeageid'::regclass) NOT NULL,
    relativeageunitid integer NOT NULL,
    relativeagescaleid integer NOT NULL,
    relativeage character varying(64) NOT NULL,
    c14ageyounger double precision NULL,
    c14ageolder double precision NULL,
    calageyounger double precision NULL,
    calageolder double precision NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.relativeages IS 'Lookup table of RelativeAges. Table is referenced by the RelativeChronology table.';
COMMENT ON COLUMN ndb.relativeages.relativeageid IS 'An arbitrary Relative Age identification number.';
COMMENT ON COLUMN ndb.relativeages.relativeageunitid IS 'Relative Age Unit (e.g. «Marine isotope stage», «Land mammal age»). Field links to the RelativeAgeUnits lookup table.';
COMMENT ON COLUMN ndb.relativeages.relativeagescaleid IS 'Relative Age Scale (e.g. «Geologic time scale», «Marine isotope stages»). Field links to the RelativeAgeScales lookup table.';
COMMENT ON COLUMN ndb.relativeages.relativeage IS 'Relative Age (e.g. «Rancholabrean», a land mammal age; «MIS 11», marine isotope stage 11).';
COMMENT ON COLUMN ndb.relativeages.c14ageyounger IS 'Younger age of the Relative Age unit in 14C yr B.P. Applies only to Relative Age units within the radiocarbon time scale.';
COMMENT ON COLUMN ndb.relativeages.c14ageolder IS 'Older age of the Relative Age unit in 14C yr B.P. Applies only to Relative Age units within the radiocarbon time scale.';
COMMENT ON COLUMN ndb.relativeages.calageyounger IS 'Younger age of the Relative Age unit in calendar years.';
COMMENT ON COLUMN ndb.relativeages.calageolder IS 'Older age of the Relative age unit in calendar years.';
COMMENT ON COLUMN ndb.relativeages.notes IS 'Free form notes or comments about Relative Age unit.';
COMMENT ON COLUMN ndb.relativeages.recdatecreated IS '';
COMMENT ON COLUMN ndb.relativeages.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX relativeages_pkey ON ndb.relativeages USING btree (relativeageid);
CREATE INDEX ix_relativeagescaleid_relativeages ON ndb.relativeages USING btree (relativeagescaleid) WITH (fillfactor='10')

--- Remove existing constraints if needed
-- ALTER TABLE ndb.relativeages DROP CONSTRAINT IF EXISTS relativeages_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.relativeages ADD CONSTRAINT relativeages_pkey PRIMARY KEY (relativeageid);

--- Foreign Key Restraints
ALTER TABLE ndb.relativeages ADD CONSTRAINT fk_relativeages_relativeageunits FOREIGN KEY (relativeageunitid) REFERENCES ndb.relativeageunits(relativeageunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.relativeages ADD CONSTRAINT fk_relativeages_relativeagescales FOREIGN KEY (relativeagescaleid) REFERENCES ndb.relativeagescales(relativeagescaleid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.relativeages;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.relativeages;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.relativeages FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.relativeages FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n