-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.geochronpublications

CREATE TABLE IF NOT EXISTS ndb.geochronpublications (

    geochronid integer NOT NULL,
    publicationid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.geochronpublications IS "Publications in which Geochronologic measurements are reported. Many older radiocarbon dates are reported in the journal Radiocarbon. Dates may be reported in multiple publications. The “publication” could be a database such as the online Canadian Archaeological Radiocarbon Database.";

--- Table indices
CREATE UNIQUE INDEX geochronpublications_pkey ON ndb.geochronpublications USING btree (geochronid, publicationid);
CREATE INDEX ix_geochronid_geochronpublications ON ndb.geochronpublications USING btree (geochronid) WITH (fillfactor='10');
CREATE INDEX ix_publicationid_geochronpublications ON ndb.geochronpublications USING btree (publicationid) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.geochronpublications DROP CONSTRAINT IF EXISTS geochronpublications_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.geochronpublications ADD CONSTRAINT geochronpublications_pkey PRIMARY KEY (geochronid, publicationid);

--- Foreign Key Restraints
ALTER TABLE ndb.geochronpublications ADD CONSTRAINT fk_geochronpublications_geochronology FOREIGN KEY (geochronid) REFERENCES ndb.geochronology(geochronid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.geochronpublications ADD CONSTRAINT fk_geochronpublications_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;