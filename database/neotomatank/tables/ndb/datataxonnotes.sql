-- ndb.datataxonnotes Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datataxonnotes

CREATE TABLE IF NOT EXISTS ndb.datataxonnotes (

    datataxonnotesid integer DEFAULT nextval('ndb.seq_datataxonnotes_datataxonnotesid'::regclass) NOT NULL,
    dataid integer NOT NULL,
    contactid integer NOT NULL,
    date date NOT NULL,
    notes text NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.datataxonnotes IS "";

--- Table indices
CREATE UNIQUE INDEX datataxonnotes_pkey ON ndb.datataxonnotes USING btree (datataxonnotesid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.datataxonnotes DROP CONSTRAINT IF EXISTS datataxonnotes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datataxonnotes ADD CONSTRAINT datataxonnotes_pkey PRIMARY KEY (datataxonnotesid);

--- Foreign Key Restraints
ALTER TABLE ndb.datataxonnotes ADD CONSTRAINT fk_datataxonnotes_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);
ALTER TABLE ndb.datataxonnotes ADD CONSTRAINT fk_datataxonnotes_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datataxonnotes;
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.datataxonnotes;
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.datataxonnotes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.datataxonnotes FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();