-- relativeagepublications definition

-- Drop table

-- DROP TABLE IF EXISTS relativeagepublications.relativeagepublications

CREATE TABLE relativeagepublications.relativeagepublications (
    relativeageid integer NOT NULL,
    publicationid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT relativeagepublications_pkey PRIMARY KEY (relativeageid, publicationid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.relativeagepublications ADD CONSTRAINT fk_relativeagepublications_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.relativeagepublications ADD CONSTRAINT fk_relativeagepublications_relativeages FOREIGN KEY (relativeageid) REFERENCES ndb.relativeages(relativeageid) ON UPDATE CASCADE ON DELETE CASCADE;