-- ndb.externalpublications Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.externalpublications

CREATE TABLE IF NOT EXISTS ndb.externalpublications (

    publicationid integer NOT NULL,
    extdatabaseid integer NOT NULL,
    extpublicationid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.externalpublications IS '';
COMMENT ON COLUMN ndb.externalpublications.publicationid IS '';
COMMENT ON COLUMN ndb.externalpublications.extdatabaseid IS '';
COMMENT ON COLUMN ndb.externalpublications.extpublicationid IS '';
COMMENT ON COLUMN ndb.externalpublications.recdatecreated IS '';
COMMENT ON COLUMN ndb.externalpublications.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX externalpublications_pkey ON ndb.externalpublications USING btree (publicationid, extdatabaseid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.externalpublications DROP CONSTRAINT IF EXISTS externalpublications_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.externalpublications ADD CONSTRAINT externalpublications_pkey PRIMARY KEY (publicationid, extdatabaseid);

--- Foreign Key Restraints
ALTER TABLE ndb.externalpublications ADD CONSTRAINT fk_externalpublications_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.externalpublications ADD CONSTRAINT fk_externalpublications_externaldatabases FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.externalpublications;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.externalpublications;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.externalpublications FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.externalpublications FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n