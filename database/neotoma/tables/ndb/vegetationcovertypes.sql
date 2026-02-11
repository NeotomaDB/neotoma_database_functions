-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.vegetationcovertypes

CREATE TABLE IF NOT EXISTS ndb.vegetationcovertypes (

    vegetationcovertypeid integer DEFAULT nextval('ndb.vegetationcovertypes_vegetationcovertypeid_seq'::regclass) NOT NULL,
    vegetationcovertype character varying(128) NULL,
    vegetationcovernotes text NULL,
    vegetationpublicationid integer NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.vegetationcovertypes IS "";

--- Table indices
CREATE UNIQUE INDEX vegetationcovertypes_pkey ON ndb.vegetationcovertypes USING btree (vegetationcovertypeid);
CREATE UNIQUE INDEX vegetationcovertypes_vegetationcovertype_key ON ndb.vegetationcovertypes USING btree (vegetationcovertype)

--- Remove existing constraints if needed
ALTER TABLE ndb.vegetationcovertypes DROP CONSTRAINT IF EXISTS vegetationcovertypes_pkey;
ALTER TABLE ndb.vegetationcovertypes DROP CONSTRAINT IF EXISTS vegetationcovertypes_vegetationcovertype_key;

--- Non-foreign key constraints
ALTER TABLE ndb.vegetationcovertypes ADD CONSTRAINT vegetationcovertypes_pkey PRIMARY KEY (vegetationcovertypeid);
ALTER TABLE ndb.vegetationcovertypes ADD CONSTRAINT vegetationcovertypes_vegetationcovertype_key UNIQUE (vegetationcovertype);

--- Foreign Key Restraints
ALTER TABLE ndb.vegetationcovertypes ADD CONSTRAINT vegetationcovertypes_vegetationpublicationid_fkey FOREIGN KEY (vegetationpublicationid) REFERENCES ndb.publications(publicationid);