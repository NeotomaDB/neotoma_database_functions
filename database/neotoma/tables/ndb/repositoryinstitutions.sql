-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.repositoryinstitutions

CREATE TABLE IF NOT EXISTS ndb.repositoryinstitutions (

    repositoryid integer DEFAULT nextval('ndb.seq_repositoryinstitutions_repositoryid'::regclass) NOT NULL,
    acronym character varying(64) NOT NULL,
    repository character varying(128) NOT NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.repositoryinstitutions IS "A lookup table of institutions that are repositories for fossil specimens. Table is referenced by the RepositorySpecimens table.";

--- Table indices
CREATE UNIQUE INDEX repositoryinstitutions_pkey ON ndb.repositoryinstitutions USING btree (repositoryid)

--- Remove existing constraints if needed
ALTER TABLE ndb.repositoryinstitutions DROP CONSTRAINT IF EXISTS repositoryinstitutions_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.repositoryinstitutions ADD CONSTRAINT repositoryinstitutions_pkey PRIMARY KEY (repositoryid);

--- Foreign Key Restraints