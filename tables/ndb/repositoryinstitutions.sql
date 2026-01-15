-- repositoryinstitutions definition

-- Drop table

-- DROP TABLE IF EXISTS repositoryinstitutions.repositoryinstitutions

CREATE TABLE repositoryinstitutions.repositoryinstitutions (
    repositoryid integer DEFAULT nextval('ndb.seq_repositoryinstitutions_repositoryid'::regclass) NOT NULL,
    acronym character varying(64) NOT NULL,
    repository character varying(128) NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT repositoryinstitutions_pkey PRIMARY KEY (repositoryid)
);


-- adempiere.wmv_ghgaudit foreign keys

;