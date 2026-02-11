-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.speleothemdriptypes

CREATE TABLE IF NOT EXISTS ndb.speleothemdriptypes (

    speleothemdriptypeid integer DEFAULT nextval('ndb.speleothemdriptypes_speleothemdriptypeid_seq'::regclass) NOT NULL,
    speleothemdriptype character varying(50) NULL,
    speleothemdriptypenotes text NULL,
    speleothemdriptypepublicationid integer NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.speleothemdriptypes IS "";

--- Table indices
CREATE UNIQUE INDEX speleothemdriptypes_pkey ON ndb.speleothemdriptypes USING btree (speleothemdriptypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.speleothemdriptypes DROP CONSTRAINT IF EXISTS speleothemdriptypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.speleothemdriptypes ADD CONSTRAINT speleothemdriptypes_pkey PRIMARY KEY (speleothemdriptypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.speleothemdriptypes ADD CONSTRAINT speleothemdriptypes_speleothemdriptypepublicationid_fkey FOREIGN KEY (speleothemdriptypepublicationid) REFERENCES ndb.publications(publicationid);