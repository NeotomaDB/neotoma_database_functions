-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.datasetpublications

CREATE TABLE IF NOT EXISTS ndb.datasetpublications (

    datasetid integer NOT NULL,
    publicationid integer NOT NULL,
    primarypub boolean NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.datasetpublications IS "This table lists the publications for datasets.";

--- Table indices
CREATE UNIQUE INDEX datasetpublications_pkey ON ndb.datasetpublications USING btree (datasetid, publicationid);
CREATE INDEX ix_datasetid_datasetpublications ON ndb.datasetpublications USING btree (datasetid) WITH (fillfactor='10');
CREATE INDEX ix_publicationid_datasetpublications ON ndb.datasetpublications USING btree (publicationid) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.datasetpublications DROP CONSTRAINT IF EXISTS datasetpublications_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.datasetpublications ADD CONSTRAINT datasetpublications_pkey PRIMARY KEY (datasetid, publicationid);

--- Foreign Key Restraints
ALTER TABLE ndb.datasetpublications ADD CONSTRAINT fk_datasetpublications_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid);
ALTER TABLE ndb.datasetpublications ADD CONSTRAINT fk_datasetpublications_datasets FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE;