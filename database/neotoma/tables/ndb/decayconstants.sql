-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.decayconstants

CREATE TABLE IF NOT EXISTS ndb.decayconstants (

    decayconstantid integer DEFAULT nextval('ndb.decayconstants_decayconstantid_seq'::regclass) NOT NULL,
    decayconstant text NULL,
    publicationid integer NULL,
    notes text NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.decayconstants IS "";

--- Table indices
CREATE UNIQUE INDEX decayconstants_pkey ON ndb.decayconstants USING btree (decayconstantid)

--- Remove existing constraints if needed
ALTER TABLE ndb.decayconstants DROP CONSTRAINT IF EXISTS decayconstants_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.decayconstants ADD CONSTRAINT decayconstants_pkey PRIMARY KEY (decayconstantid);

--- Foreign Key Restraints
ALTER TABLE ndb.decayconstants ADD CONSTRAINT decayconstants_publicationid_fkey FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid);