-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.publicationtranslators

CREATE TABLE IF NOT EXISTS ndb.publicationtranslators (

    translatorid integer DEFAULT nextval('ndb.seq_publicationtranslators_translatorid'::regclass) NOT NULL,
    publicationid integer NOT NULL,
    translatororder integer NULL,
    familyname character varying(64) NULL,
    initials character varying(8) NULL,
    suffix character varying(8) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.publicationtranslators IS "";

--- Table indices
CREATE UNIQUE INDEX publicationtranslators_pkey ON ndb.publicationtranslators USING btree (translatorid)

--- Remove existing constraints if needed
ALTER TABLE ndb.publicationtranslators DROP CONSTRAINT IF EXISTS publicationtranslators_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.publicationtranslators ADD CONSTRAINT publicationtranslators_pkey PRIMARY KEY (translatorid);

--- Foreign Key Restraints
ALTER TABLE ndb.publicationtranslators ADD CONSTRAINT fk_publicationtranslators_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;