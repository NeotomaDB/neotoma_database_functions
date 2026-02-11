-- ndb.landusetypes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.landusetypes

CREATE TABLE IF NOT EXISTS ndb.landusetypes (

    landusecovertypeid integer DEFAULT nextval('ndb.landusetypes_landusecovertypeid_seq'::regclass) NOT NULL,
    landusecovertype character varying(128) NULL,
    landusecovernotes text NULL,
    publicationid integer NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.landusetypes IS "";

--- Table indices
CREATE UNIQUE INDEX landusetypes_pkey ON ndb.landusetypes USING btree (landusecovertypeid);
CREATE UNIQUE INDEX landusetypes_landusecovertype_key ON ndb.landusetypes USING btree (landusecovertype)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.landusetypes DROP CONSTRAINT IF EXISTS landusetypes_pkey;
-- ALTER TABLE ndb.landusetypes DROP CONSTRAINT IF EXISTS landusetypes_landusecovertype_key;

--- Non-foreign key constraints
ALTER TABLE ndb.landusetypes ADD CONSTRAINT landusetypes_pkey PRIMARY KEY (landusecovertypeid);
ALTER TABLE ndb.landusetypes ADD CONSTRAINT landusetypes_landusecovertype_key UNIQUE (landusecovertype);

--- Foreign Key Restraints
ALTER TABLE ndb.landusetypes ADD CONSTRAINT landusetypes_landuseclasspublicationid_fkey FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid);

--- Triggers