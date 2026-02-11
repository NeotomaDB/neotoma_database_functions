-- ap.querytable Table definition

-- Drop table

-- DROP TABLE IF EXISTS ap.querytable

CREATE TABLE IF NOT EXISTS ap.querytable (

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
    geopol integer[] NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ap.querytable IS "";

--- Table indices
CREATE INDEX altitudeidx ON ap.querytable USING btree (altitude);
CREATE INDEX atyindex ON ap.querytable USING btree (agetype);
CREATE INDEX contactidindex ON ap.querytable USING gin (contacts gin__int_ops);
CREATE INDEX datasetidindex ON ap.querytable USING btree (datasetid);
CREATE INDEX depenvindex ON ap.querytable USING btree (depenvt);
CREATE UNIQUE INDEX distinctrows ON ap.querytable USING btree (datasetid, chronologyid);
CREATE INDEX dstindex ON ap.querytable USING btree (datasettype);
CREATE INDEX geoidindex ON ap.querytable USING gin (geopol gin__int_ops);
CREATE INDEX keywordidindex ON ap.querytable USING gin (keywords gin__int_ops);
CREATE INDEX olderidx ON ap.querytable USING btree (older);
CREATE INDEX publicationidindex ON ap.querytable USING gin (publications gin__int_ops);
CREATE INDEX siteidindex ON ap.querytable USING btree (siteid);
CREATE INDEX sitename ON ap.querytable USING gist (sitename gist_trgm_ops);
CREATE INDEX spatialgeom ON ap.querytable USING gist (geog);
CREATE INDEX taxonidindex ON ap.querytable USING gin (taxa gin__int_ops);
CREATE INDEX youngeridx ON ap.querytable USING btree (younger);
CREATE INDEX idx_querytable_composite ON ap.querytable USING btree (siteid, datasetid) INCLUDE (sitename, altitude, younger, older);
CREATE INDEX idx_querytable_pagination ON ap.querytable USING btree (siteid, datasetid)

--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints

--- Triggers