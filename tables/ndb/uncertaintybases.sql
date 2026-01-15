-- uncertaintybases definition

-- Drop table

-- DROP TABLE IF EXISTS uncertaintybases.uncertaintybases

CREATE TABLE uncertaintybases.uncertaintybases (
    uncertaintybasisid integer DEFAULT nextval('ndb.uncertaintybases_uncertaintybasisid_seq'::regclass) NOT NULL,
    uncertaintybasis text NULL,
    CONSTRAINT uncertaintybases_pkey PRIMARY KEY (uncertaintybasisid),
    CONSTRAINT uniquebasis UNIQUE (uncertaintybasis)
);


-- adempiere.wmv_ghgaudit foreign keys

;