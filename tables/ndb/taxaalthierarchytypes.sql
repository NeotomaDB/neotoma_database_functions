-- taxaalthierarchytypes definition

-- Drop table

-- DROP TABLE IF EXISTS taxaalthierarchytypes.taxaalthierarchytypes

CREATE TABLE taxaalthierarchytypes.taxaalthierarchytypes (
    taxaalthierarchytypeid integer DEFAULT nextval('ndb.seq_taxaalthierarchytypes_taxaalthierarchytypeid'::regclass) NOT NULL,
    taxaalthierarchyname character varying(50) NOT NULL,
    taxaalthierarchydescript text NULL,
    CONSTRAINT taxaalthierarchytypes_pkey PRIMARY KEY (taxaalthierarchytypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

;