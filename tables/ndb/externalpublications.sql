-- externalpublications definition

-- Drop table

-- DROP TABLE IF EXISTS externalpublications.externalpublications

CREATE TABLE externalpublications.externalpublications (
    publicationid integer NOT NULL,
    extdatabaseid integer NOT NULL,
    extpublicationid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT externalpublications_pkey PRIMARY KEY (publicationid, extdatabaseid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.externalpublications ADD CONSTRAINT fk_externalpublications_publications FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.externalpublications ADD CONSTRAINT fk_externalpublications_externaldatabases FOREIGN KEY (extdatabaseid) REFERENCES ndb.externaldatabases(extdatabaseid) ON UPDATE CASCADE ON DELETE CASCADE;