-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isovariablescaletypes

CREATE TABLE IF NOT EXISTS ndb.isovariablescaletypes (

    variableid integer NOT NULL,
    isoscaletypeid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.isovariablescaletypes IS "";

--- Table indices
CREATE UNIQUE INDEX isovariablescaletypes_pkey ON ndb.isovariablescaletypes USING btree (variableid, isoscaletypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.isovariablescaletypes DROP CONSTRAINT IF EXISTS isovariablescaletypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isovariablescaletypes ADD CONSTRAINT isovariablescaletypes_pkey PRIMARY KEY (variableid, isoscaletypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.isovariablescaletypes ADD CONSTRAINT fk_isovariablescaletypes_variables FOREIGN KEY (variableid) REFERENCES ndb.variables(variableid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isovariablescaletypes ADD CONSTRAINT fk_isovariablescaletypes_isoscaletypes FOREIGN KEY (isoscaletypeid) REFERENCES ndb.isoscaletypes(isoscaletypeid) ON UPDATE CASCADE ON DELETE CASCADE;