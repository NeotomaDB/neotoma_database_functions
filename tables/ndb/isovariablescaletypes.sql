-- isovariablescaletypes definition

-- Drop table

-- DROP TABLE IF EXISTS isovariablescaletypes.isovariablescaletypes

CREATE TABLE isovariablescaletypes.isovariablescaletypes (
    variableid integer NOT NULL,
    isoscaletypeid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isovariablescaletypes_pkey PRIMARY KEY (variableid, isoscaletypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.isovariablescaletypes ADD CONSTRAINT fk_isovariablescaletypes_variables FOREIGN KEY (variableid) REFERENCES ndb.variables(variableid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isovariablescaletypes ADD CONSTRAINT fk_isovariablescaletypes_isoscaletypes FOREIGN KEY (isoscaletypeid) REFERENCES ndb.isoscaletypes(isoscaletypeid) ON UPDATE CASCADE ON DELETE CASCADE;