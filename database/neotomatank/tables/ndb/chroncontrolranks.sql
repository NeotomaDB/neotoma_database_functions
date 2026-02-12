-- ndb.chroncontrolranks Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.chroncontrolranks

CREATE TABLE IF NOT EXISTS ndb.chroncontrolranks (

    chroncontrolrankid integer DEFAULT nextval('ndb.seq_chroncontrolranks_chroncontrolrankid'::regclass) NOT NULL,
    chroncontrolid integer NULL,
    accuracyrankid integer NULL,
    accuracydirectionid integer NULL,
    accuracydistributionid integer NULL,
    precisionrankid integer NULL,
    outlier boolean NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.chroncontrolranks IS '';
COMMENT ON COLUMN ndb.chroncontrolranks.chroncontrolrankid IS '';
COMMENT ON COLUMN ndb.chroncontrolranks.chroncontrolid IS '';
COMMENT ON COLUMN ndb.chroncontrolranks.accuracyrankid IS '';
COMMENT ON COLUMN ndb.chroncontrolranks.accuracydirectionid IS '';
COMMENT ON COLUMN ndb.chroncontrolranks.accuracydistributionid IS '';
COMMENT ON COLUMN ndb.chroncontrolranks.precisionrankid IS '';
COMMENT ON COLUMN ndb.chroncontrolranks.outlier IS '';
COMMENT ON COLUMN ndb.chroncontrolranks.recdatecreated IS '';
COMMENT ON COLUMN ndb.chroncontrolranks.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX chroncontrolranks_pkey ON ndb.chroncontrolranks USING btree (chroncontrolrankid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.chroncontrolranks DROP CONSTRAINT IF EXISTS chroncontrolranks_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.chroncontrolranks ADD CONSTRAINT chroncontrolranks_pkey PRIMARY KEY (chroncontrolrankid);

--- Foreign Key Restraints
ALTER TABLE ndb.chroncontrolranks ADD CONSTRAINT fk_chroncontrolranks_chroncontrolprecisionranks FOREIGN KEY (precisionrankid) REFERENCES ndb.chroncontrolprecisionranks(precisionrankid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrolranks ADD CONSTRAINT fk_chroncontrolranks_chroncontrolaccuracyranks FOREIGN KEY (accuracyrankid) REFERENCES ndb.chroncontrolaccuracyranks(accuracyrankid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrolranks ADD CONSTRAINT fk_chroncontrolranks_chroncontrolaccuracydistributions FOREIGN KEY (accuracydistributionid) REFERENCES ndb.chroncontrolaccuracydistributions(accuracydistributionid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrolranks ADD CONSTRAINT fk_chroncontrolranks_chroncontrolaccuracydirections FOREIGN KEY (accuracydirectionid) REFERENCES ndb.chroncontrolaccuracydirections(accuracydirectionid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrolranks ADD CONSTRAINT fk_chroncontrolranks_chroncontrols FOREIGN KEY (chroncontrolid) REFERENCES ndb.chroncontrols(chroncontrolid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chroncontrolranks;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.chroncontrolranks;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.chroncontrolranks FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.chroncontrolranks FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n