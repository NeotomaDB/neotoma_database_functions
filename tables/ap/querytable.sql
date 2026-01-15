-- querytable definition

-- Drop table

-- DROP TABLE IF EXISTS querytable.querytable

CREATE TABLE querytable.querytable (
    siteid integer NULL,
    sitename character varying(128) NULL,
    datasetid integer NULL,
    chronologyid integer NULL,
    altitude double precision NULL,
    datasettype character varying(64) NULL,
    databaseid integer NULL,
    collectionunitid integer NULL,
    colltype character varying(64) NULL,
    depenvt character varying(255) NULL,
    geog geography NULL,
    older double precision NULL,
    younger double precision NULL,
    agetype character varying(64) NULL,
    publications integer[] NULL,
    taxa integer[] NULL,
    keywords integer[] NULL,
    contacts integer[] NULL,
    collectionunit jsonb NULL,
    geopol integer[] NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

;