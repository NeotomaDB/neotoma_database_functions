-- sysdiagrams definition

-- Drop table

-- DROP TABLE IF EXISTS sysdiagrams.sysdiagrams

CREATE TABLE sysdiagrams.sysdiagrams (
    name character varying NOT NULL,
    principal_id integer NOT NULL,
    diagram_id integer DEFAULT nextval('ndb.seq_sysdiagrams_diagram_id'::regclass) NOT NULL,
    version integer NULL,
    definition bytea NULL,
    CONSTRAINT sysdiagrams_pkey PRIMARY KEY (diagram_id)
);


-- adempiere.wmv_ghgaudit foreign keys

;