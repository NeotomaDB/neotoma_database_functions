-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasettaxonnotes

CREATE TABLE IF NOT EXISTS ndb.datasettaxonnotes (

    datasetid integer NOT NULL,
    taxonid integer NOT NULL,
    contactid integer NOT NULL,
    date date NOT NULL,
    notes text NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.datasettaxonnotes IS "";

--- Table indices
CREATE UNIQUE INDEX datasettaxonnotes_pkey ON ndb.datasettaxonnotes USING btree (datasetid, taxonid)

--- Remove existing constraints if needed
ALTER TABLE ndb.datasettaxonnotes DROP CONSTRAINT IF EXISTS datasettaxonnotes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datasettaxonnotes ADD CONSTRAINT datasettaxonnotes_pkey PRIMARY KEY (datasetid, taxonid);

--- Foreign Key Restraints
ALTER TABLE ndb.datasettaxonnotes ADD CONSTRAINT fk_datasettaxonnotes_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasettaxonnotes ADD CONSTRAINT fk_datasettaxonnotes_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasettaxonnotes ADD CONSTRAINT fk_datasettaxonnotes_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);