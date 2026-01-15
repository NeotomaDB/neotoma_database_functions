-- datataxonnotes definition

-- Drop table

-- DROP TABLE IF EXISTS datataxonnotes.datataxonnotes

CREATE TABLE datataxonnotes.datataxonnotes (
    datataxonnotesid integer DEFAULT nextval('ndb.seq_datataxonnotes_datataxonnotesid'::regclass) NOT NULL,
    dataid integer NOT NULL,
    contactid integer NOT NULL,
    date date NOT NULL,
    notes text NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT datataxonnotes_pkey PRIMARY KEY (datataxonnotesid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.datataxonnotes ADD CONSTRAINT fk_datataxonnotes_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);
ALTER TABLE ndb.datataxonnotes ADD CONSTRAINT fk_datataxonnotes_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;