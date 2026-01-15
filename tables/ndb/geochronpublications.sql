-- geochronpublications definition

-- Drop table

-- DROP TABLE IF EXISTS geochronpublications.geochronpublications

CREATE TABLE geochronpublications.geochronpublications (
    geochronid integer NOT NULL,
    publicationid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT geochronpublications_pkey PRIMARY KEY (geochronid, publicationid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.geochronpublications ADD CONSTRAINT fk_geochronpublications_geochronology FOREIGN KEY (geochronid) REFERENCES ndb.geochronology(geochronid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.geochronpublications ADD CONSTRAINT fk_geochronpublications_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;