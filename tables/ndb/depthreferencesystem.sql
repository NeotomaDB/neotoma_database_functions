-- depthreferencesystem definition

-- Drop table

-- DROP TABLE IF EXISTS depthreferencesystem.depthreferencesystem

CREATE TABLE depthreferencesystem.depthreferencesystem (
    depthreferencesystemid integer DEFAULT nextval('ndb.depthreferencesystem_depthreferencesystemid_seq'::regclass) NOT NULL,
    depthreference text NULL,
    depthreferencenotes text NULL,
    depthreferencepublicationid integer NULL,
    CONSTRAINT depthreferencesystem_pkey PRIMARY KEY (depthreferencesystemid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.depthreferencesystem ADD CONSTRAINT depthreferencesystem_depthreferencepublicationid_fkey FOREIGN KEY (depthreferencepublicationid) REFERENCES ndb.publications(publicationid);