-- ndb.variablecontexts Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.variablecontexts

CREATE TABLE IF NOT EXISTS ndb.variablecontexts (

    variablecontextid integer DEFAULT nextval('ndb.seq_variablecontexts_variablecontextid'::regclass) NOT NULL,
    variablecontext character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.variablecontexts IS 'Variable Contexts lookup table. Table is referenced by the Variables table.';
COMMENT ON COLUMN ndb.variablecontexts.variablecontextid IS 'An arbitrary Variable Context identification number.';
COMMENT ON COLUMN ndb.variablecontexts.variablecontext IS 'Depositional context. Examples are:
*anachronic – specimen older than the primary deposit, e.g. a Paleozoic spore in a Holocene deposit; may be redeposited from the catchment or may be derived from long distance, e.g. Tertiary pollen grains in Quaternary sediments with no local Tertiary source. A Pleistocene specimen in a Holocene archaeological deposit, possibly resulting from aboriginal fossil collecting, would also be anachronic.
*intrusive – specimen generally younger younger than the primary deposit, e.g. a domestic pig in an otherwise Pleistocene deposit in North America.
*redeposited – specimen older than the primary deposit and assumed to have been redeposited from a local source by natural causes.
*articulated – articulated skeleton
*clump – clump, esp. of pollen grains
';
COMMENT ON COLUMN ndb.variablecontexts.recdatecreated IS '';
COMMENT ON COLUMN ndb.variablecontexts.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX variablecontexts_pkey ON ndb.variablecontexts USING btree (variablecontextid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.variablecontexts DROP CONSTRAINT IF EXISTS variablecontexts_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.variablecontexts ADD CONSTRAINT variablecontexts_pkey PRIMARY KEY (variablecontextid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.variablecontexts;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.variablecontexts;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.variablecontexts FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.variablecontexts FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n