-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.unitsdatasettypes

CREATE TABLE IF NOT EXISTS ndb.unitsdatasettypes (

    datasettypeid integer NOT NULL,
    variableunitsid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.unitsdatasettypes IS "Join table, associating measurement units with various datasettypes.";

--- Table indices
CREATE UNIQUE INDEX unitsdatasettypes_pkey ON ndb.unitsdatasettypes USING btree (datasettypeid, variableunitsid)

--- Remove existing constraints if needed
ALTER TABLE ndb.unitsdatasettypes DROP CONSTRAINT IF EXISTS unitsdatasettypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.unitsdatasettypes ADD CONSTRAINT unitsdatasettypes_pkey PRIMARY KEY (datasettypeid, variableunitsid);

--- Foreign Key Restraints
ALTER TABLE ndb.unitsdatasettypes ADD CONSTRAINT fk_unitsdatasettypes_datasettypes FOREIGN KEY (datasettypeid) REFERENCES ndb.datasettypes(datasettypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.unitsdatasettypes ADD CONSTRAINT fk_unitsdatasettypes_variableunits FOREIGN KEY (variableunitsid) REFERENCES ndb.variableunits(variableunitsid) ON UPDATE CASCADE ON DELETE CASCADE;