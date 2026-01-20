-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.variablecontexts

CREATE TABLE IF NOT EXISTS ndb.variablecontexts (

    variablecontextid integer DEFAULT nextval('ndb.seq_variablecontexts_variablecontextid'::regclass) NOT NULL,
    variablecontext character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.variablecontexts IS "Variable Contexts lookup table. Table is referenced by the Variables table.";

--- Table indices
CREATE UNIQUE INDEX variablecontexts_pkey ON ndb.variablecontexts USING btree (variablecontextid)

--- Remove existing constraints if needed
ALTER TABLE ndb.variablecontexts DROP CONSTRAINT IF EXISTS variablecontexts_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.variablecontexts ADD CONSTRAINT variablecontexts_pkey PRIMARY KEY (variablecontextid);

--- Foreign Key Restraints