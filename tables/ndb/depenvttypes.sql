-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.depenvttypes

CREATE TABLE IF NOT EXISTS ndb.depenvttypes (

    depenvtid integer DEFAULT nextval('ndb.seq_depenvttypes_depenvtid'::regclass) NOT NULL,
    depenvt character varying(255) NOT NULL,
    depenvthigherid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.depenvttypes IS "Lookup table of Depositional Environment Types. Table is referenced by the CollectionUnits table.";

--- Table indices
CREATE UNIQUE INDEX depenvttypes_pkey ON ndb.depenvttypes USING btree (depenvtid)

--- Remove existing constraints if needed
ALTER TABLE ndb.depenvttypes DROP CONSTRAINT IF EXISTS depenvttypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.depenvttypes ADD CONSTRAINT depenvttypes_pkey PRIMARY KEY (depenvtid);

--- Foreign Key Restraints
ALTER TABLE ndb.depenvttypes ADD CONSTRAINT fk_depenvthigherid FOREIGN KEY (depenvthigherid) REFERENCES ndb.depenvttypes(depenvtid);