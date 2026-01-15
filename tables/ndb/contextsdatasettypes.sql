-- contextsdatasettypes definition

-- Drop table

-- DROP TABLE IF EXISTS contextsdatasettypes.contextsdatasettypes

CREATE TABLE contextsdatasettypes.contextsdatasettypes (
    datasettypeid integer NOT NULL,
    variablecontextid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT contextsdatasettypes_pkey PRIMARY KEY (datasettypeid, variablecontextid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.contextsdatasettypes ADD CONSTRAINT fk_contextsdatasettypes_variablecontexts FOREIGN KEY (variablecontextid) REFERENCES ndb.variablecontexts(variablecontextid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.contextsdatasettypes ADD CONSTRAINT fk_contextsdatasettypes_datasettypes FOREIGN KEY (datasettypeid) REFERENCES ndb.datasettypes(datasettypeid) ON UPDATE CASCADE ON DELETE CASCADE;