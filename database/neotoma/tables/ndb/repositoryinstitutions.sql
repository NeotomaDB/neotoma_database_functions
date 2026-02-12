-- ndb.repositoryinstitutions Table definition

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


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.repositoryinstitutions IS 'A lookup table of institutions that are repositories for fossil specimens. Table is referenced by the RepositorySpecimens table.';
COMMENT ON COLUMN ndb.repositoryinstitutions.repositoryid IS 'An arbitrary Repository identification number. Repositories include museums, university departments, and various governmental agencies.';
COMMENT ON COLUMN ndb.repositoryinstitutions.acronym IS 'A unique acronym for the repository. Many repositories have well-established acronyms (e.g. AMNH = American Museum of Natural History); however, there is no official list. Various acronyms have been used for some institutions, and in some cases the same acronym has been used for different institutions. Consequently, the database acronym may differ from the acronym used in some publications. For example, «CMNH» has been used for the Carnegie Museum of Natural History, the Cleveland Museum of Natural History, and the Cincinnati Museum of Natural History. In Neotoma, two of these institutions were assigned different acronyms, ones that have been used for them in other publications: CM – Carnegie Museum of Natural History, CLM – Cleveland Museum of Natural History.';
COMMENT ON COLUMN ndb.repositoryinstitutions.repository IS 'The full name of the repository.';
COMMENT ON COLUMN ndb.repositoryinstitutions.notes IS 'Free form notes or comments about the repository, especially notes about name changes, closures, and specimen transfers. In some cases, it is known that the specimens were transferred, but their current disposition may be uncertain.';
COMMENT ON COLUMN ndb.repositoryinstitutions.recdatecreated IS '';
COMMENT ON COLUMN ndb.repositoryinstitutions.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX repositoryinstitutions_pkey ON ndb.repositoryinstitutions USING btree (repositoryid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.repositoryinstitutions DROP CONSTRAINT IF EXISTS repositoryinstitutions_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.repositoryinstitutions ADD CONSTRAINT repositoryinstitutions_pkey PRIMARY KEY (repositoryid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.repositoryinstitutions;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.repositoryinstitutions;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.repositoryinstitutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.repositoryinstitutions FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n