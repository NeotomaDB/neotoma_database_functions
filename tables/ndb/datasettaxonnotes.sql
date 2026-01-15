-- datasettaxonnotes definition

-- Drop table

-- DROP TABLE IF EXISTS datasettaxonnotes.datasettaxonnotes

CREATE TABLE datasettaxonnotes.datasettaxonnotes (
    datasetid integer NOT NULL,
    taxonid integer NOT NULL,
    contactid integer NOT NULL,
    date date NOT NULL,
    notes text NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT datasettaxonnotes_pkey PRIMARY KEY (datasetid, taxonid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.datasettaxonnotes ADD CONSTRAINT fk_datasettaxonnotes_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasettaxonnotes ADD CONSTRAINT fk_datasettaxonnotes_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.datasettaxonnotes ADD CONSTRAINT fk_datasettaxonnotes_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid);