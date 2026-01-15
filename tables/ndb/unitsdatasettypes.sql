-- unitsdatasettypes definition

-- Drop table

-- DROP TABLE IF EXISTS unitsdatasettypes.unitsdatasettypes

CREATE TABLE unitsdatasettypes.unitsdatasettypes (
    datasettypeid integer NOT NULL,
    variableunitsid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT unitsdatasettypes_pkey PRIMARY KEY (datasettypeid, variableunitsid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.unitsdatasettypes ADD CONSTRAINT fk_unitsdatasettypes_datasettypes FOREIGN KEY (datasettypeid) REFERENCES ndb.datasettypes(datasettypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.unitsdatasettypes ADD CONSTRAINT fk_unitsdatasettypes_variableunits FOREIGN KEY (variableunitsid) REFERENCES ndb.variableunits(variableunitsid) ON UPDATE CASCADE ON DELETE CASCADE;