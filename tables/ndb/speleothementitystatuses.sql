-- speleothementitystatuses definition

-- Drop table

-- DROP TABLE IF EXISTS speleothementitystatuses.speleothementitystatuses

CREATE TABLE speleothementitystatuses.speleothementitystatuses (
    entitystatusid integer DEFAULT nextval('ndb.speleothementitystatuses_entitystatusid_seq'::regclass) NOT NULL,
    entitystatus text NULL,
    CONSTRAINT speleothementitystatuses_pkey PRIMARY KEY (entitystatusid)
);


-- adempiere.wmv_ghgaudit foreign keys

;